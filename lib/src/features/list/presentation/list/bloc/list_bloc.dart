import 'package:template_flutter_app/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:template_flutter_app/src/features/common/datasource/exceptions/no_more_data_available_exception.dart';
import 'package:template_flutter_app/src/features/list/entity/product.dart';
import 'package:template_flutter_app/src/features/list/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'list_event.dart';
part 'list_state.dart';

@injectable
class ListBloc extends Bloc<ListEvent, ListState> {
  // MARK: Properties
  final List _streams = [];

  // MARK: Dependencies
  final ProductRepository _productRepository;

  // MARk: LifeCycle
  ListBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(LoadingState()) {
    on<LoadEvent>((event, emit) async {
      try {
        await _productRepository.loadMore();
        emit(IdleState(
          items: _productRepository.items,
        ));
      } on NoDataAvailableException catch (_) {
        _productRepository.reset();
        emit(EmptyState());
      } on NoMoreDataAvailableException catch (_) {
        emit(IdleState(
          items: _productRepository.items,
        ));
      } catch (_) {
        _productRepository.reset();
        emit(ErrorState());
      }
    });

    on<RefreshEvent>((event, emit) async {
      _productRepository.reset();
      add(LoadEvent());
    });
  }

  @override
  Future<void> close() {
    _streams.forEach((stream) => stream.cancel());
    return super.close();
  }
}
