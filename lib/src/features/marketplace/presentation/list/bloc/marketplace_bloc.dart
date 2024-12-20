import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/event/event_bus/event_added_event.dart';
import 'package:riada/src/features/user/event_bus/user_log_state_updated_event.dart';
import 'package:riada/src/features/user/repository/city_repository.dart';
import 'package:riada/src/features/user/repository/user_repository.dart';
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
  final UserRepository _userRepository;

  // MARk: LifeCycle
  MarketplaceBloc({
    required CityRepository cityRepository,
    required UserRepository userRepository,
  })  : _cityRepository = cityRepository,
        _userRepository = userRepository,
        super(LoadingState()) {
    on<LoadEvent>((event, emit) async {
      emitIdleState();
    });

    on<ChangeCityEvent>((event, emit) async {
      if (event.city != null) {
        _cityRepository.selectedCity = event.city!;
      }

      emitIdleState();
    });

    _streams.add(AppEventBus.instance
        .on<UserLogStateUpdatedEvent>()
        .listen((event) async {
      add(LoadEvent());
    }));

    _streams
        .add(AppEventBus.instance.on<EventAddedEvent>().listen((event) async {
      add(LoadEvent());
    }));
  }

  @override
  Future<void> close() {
    _streams.forEach((stream) => stream.cancel());
    return super.close();
  }

  // MARK: Private
  Future emitIdleState() async {
    try {
      await _userRepository.getCurrentUser();
      emit(IdleState(
        cities: _cityRepository.cities,
        selectedCity: _cityRepository.selectedCity,
        shouldLoginBeforeAddingEvent: false,
      ));
    } catch (_) {
      emit(IdleState(
        cities: _cityRepository.cities,
        selectedCity: _cityRepository.selectedCity,
        shouldLoginBeforeAddingEvent: true,
      ));
    }
  }
}
