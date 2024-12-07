import 'package:injectable/injectable.dart';
import 'package:riada/src/features/event/datasource/event_data_source.dart';
import 'package:riada/src/features/marketplace/presentation/carousel/item/marketplace_carousel_item.dart';
import 'package:riada/src/features/marketplace/presentation/carousel/item/marketplace_carousel_type.dart';
import 'package:riada/src/features/user/datasource/auth_data_source.dart';
import 'package:riada/src/features/user/datasource/exceptions/user_not_logged_exception.dart';
import 'package:riada/src/features/user/repository/city_repository.dart';

@injectable
class MarketplaceCarouselRepository {
  //MARK: -  Dependency
  final EventDataSource _eventDataSource;
  final AuthDataSource _authDataSource;
  final CityRepository _cityRepository;

  //MARK: -  LifeCycle
  MarketplaceCarouselRepository({
    required EventDataSource eventDataSource,
    required AuthDataSource authDataSource,
    required CityRepository cityRepository,
  })  : _eventDataSource = eventDataSource,
        _authDataSource = authDataSource,
        _cityRepository = cityRepository,
        super();

  //MARK: - Public
  Future<List<MarketplaceCarouselItem>> get({
    required MarketplaceCarouselType type,
  }) async {
    switch (type) {
      case MarketplaceCarouselType.calendar:
        return _loadCalendarEvents();
      case MarketplaceCarouselType.upcoming:
        return _loadUpcomingEvents();
    }
  }

  // MARK: - Private
  Future<List<MarketplaceCarouselItem>> _loadCalendarEvents() async {
    try {
      final eventOrganizations =
          await _eventDataSource.getNextEventOrganizations(_userId);
      final eventParticipations =
          await _eventDataSource.getNextEventParticipations(_userId);
      final filteredEventParticipations =
          eventParticipations.where((e) => eventOrganizations.contains(e));
      return [
        ...eventOrganizations
            .map((e) => OrganizeEventMarketplaceItem(event: e)),
        ...filteredEventParticipations
            .map((e) => ParticipateEventMarketplaceItem(event: e)),
      ];
    } on UserNotLoggedException catch (_) {
      return [];
    }
  }

  Future<List<MarketplaceCarouselItem>> _loadUpcomingEvents() async {
    final events = await _eventDataSource.getNextNearestEvents(
      city: _cityRepository.selectedCity,
    );
    return events.map((e) => EventMarketplaceItem(event: e)).toList();
  }

  String get _userId {
    final authUser = _authDataSource.getUser();

    if (authUser == null) throw UserNotLoggedException();

    return authUser.uid;
  }
}
