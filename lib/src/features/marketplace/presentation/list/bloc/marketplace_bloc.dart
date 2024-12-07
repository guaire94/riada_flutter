import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/user/event_bus/user_log_state_updated_event.dart';
import 'package:riada/src/features/user/repository/city_repository.dart';
import 'package:riada/src/utils/app_event_bus.dart';
import 'package:riada/src/utils/city.dart';

part 'marketplace_event.dart';
part 'marketplace_state.dart';

@injectable
class MarketplaceBloc extends Bloc<MarketplaceEvent, MarketplaceState> {
  // MARK: Properties
  final List _streams = [];

  // MARK: Dependencies
  final CityRepository _cityRepository;

  // MARk: LifeCycle
  MarketplaceBloc({
    required CityRepository cityRepository,
  })  : _cityRepository = cityRepository,
        super(LoadingState()) {
    on<LoadEvent>((event, emit) async {
      try {
        emit(IdleState(
          cities: _cityRepository.cities,
          selectedCity: _cityRepository.selectedCity,
        ));
      } catch (_) {
        emit(IdleState(
          cities: _cityRepository.cities,
          selectedCity: _cityRepository.selectedCity,
        ));
      }
    });

    on<ChangeCityEvent>((event, emit) async {
      if (event.city != null) {
        _cityRepository.selectedCity = event.city!;
      }

      emit(IdleState(
        cities: _cityRepository.cities,
        selectedCity: _cityRepository.selectedCity,
      ));
    });

    _streams.add(AppEventBus.instance
        .on<UserLogStateUpdatedEvent>()
        .listen((event) async {
      add(LoadEvent());
    }));
  }

  @override
  Future<void> close() {
    _streams.forEach((stream) => stream.cancel());
    return super.close();
  }
}
