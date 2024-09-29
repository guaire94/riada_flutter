import 'package:riada/src/features/marketplace/presentation/carousel/item/marketplace_carousel_item.dart';
import 'package:riada/src/features/marketplace/presentation/carousel/item/marketplace_carousel_type.dart';
import 'package:riada/src/features/event/datasource/event_data_source.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:injectable/injectable.dart';

@injectable
class MarketplaceCarouselRepository {
  //MARK: -  Dependency
  final EventDataSource _eventDataSource;

  //MARK: - Properties
  List<MarketplaceCarouselItem> _items = [];

  // MARK: - Getter
  List<MarketplaceCarouselItem> get items => _items;

  //MARK: -  LifeCycle
  MarketplaceCarouselRepository({
    required EventDataSource eventDataSource,
  })  : _eventDataSource = eventDataSource,
        super();

  //MARK: - Public
  Future load({
    required MarketplaceCarouselType type,
  }) async {
    if (items.isEmpty) {
      switch (type) {
        case MarketplaceCarouselType.events:
          await _loadEvents();
          break;
      }
    }
  }

  // MARK: - Private
  Future _loadEvents() async {
    List<Event> events = await _eventDataSource.getEvents(limit: 5);
    _items.addAll(events.map((e) => EventMarketplaceItem(event: e)));
  }
}
