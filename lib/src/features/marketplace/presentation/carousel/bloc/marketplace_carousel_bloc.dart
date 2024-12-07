import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/marketplace/presentation/carousel/item/marketplace_carousel_item.dart';
import 'package:riada/src/features/marketplace/presentation/carousel/item/marketplace_carousel_type.dart';
import 'package:riada/src/features/marketplace/repository/marketplace_carousel_repository.dart';

part 'marketplace_carousel_event.dart';
part 'marketplace_carousel_state.dart';

@injectable
class MarketplaceCarouselBloc
    extends Bloc<MarketplaceCarouselEvent, MarketplaceCarouselState> {
  // MARK: Properties
  final List _streams = [];

  // MARK: Dependencies
  final MarketplaceCarouselRepository _marketplaceCarouselRepository;

  // MARK: LifeCycle
  MarketplaceCarouselBloc({
    required MarketplaceCarouselRepository marketplaceCarouselRepository,
  })  : this._marketplaceCarouselRepository = marketplaceCarouselRepository,
        super(LoadingState()) {
    on<LoadEvent>(_onLoad);
  }

  Future<void> _onLoad(
    LoadEvent event,
    Emitter<MarketplaceCarouselState> emit,
  ) async {
    emit(LoadingState());
    try {
      final items = await _marketplaceCarouselRepository.get(
        type: event.type,
      );
      if (items.isEmpty) {
        emit(EmptyState());
      } else {
        emit(
          IdleState(
            items: items,
          ),
        );
      }
    } catch (_) {
      emit(EmptyState());
    }
  }

  @override
  Future<void> close() {
    _streams.forEach((stream) => stream.cancel());
    return super.close();
  }
}
