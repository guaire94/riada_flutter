import 'package:template_flutter_app/src/features/list/entity/product.dart';
import 'package:template_flutter_app/src/features/list/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'details_event.dart';
part 'details_state.dart';

@injectable
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  // MARK: Dependency
  final ProductRepository _productRepository;

  // MARk: LifeCycle
  DetailsBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(LoadingState()) {
    on<LoadEvent>((event, emit) async {
      try {
        final product = await _productRepository.getProductFrom(
          event.productId,
        );
        emit(IdleState(
          product: product,
        ));
      } catch (_) {
        emit(ErrorState());
      }
    });
  }
}
