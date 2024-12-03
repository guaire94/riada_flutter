import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/user/event_bus/user_log_state_updated_event.dart';
import 'package:riada/src/features/user/usecase/get_cities_usecase.dart';
import 'package:riada/src/utils/app_event_bus.dart';
import 'package:riada/src/utils/city.dart';

part 'marketplace_event.dart';
part 'marketplace_state.dart';

@injectable
class MarketplaceBloc extends Bloc<MarketplaceEvent, MarketplaceState> {
  // MARK: Properties
  final List _streams = [];
  late List<City> _cities;
  late City _selectedCity;

  // MARK: Dependency
  final GetCitiesUseCase _getCitiesUseCase;

  // MARk: LifeCycle
  MarketplaceBloc({
    required GetCitiesUseCase getCitiesUseCase,
  })  : _getCitiesUseCase = getCitiesUseCase,
        super(LoadingState()) {
    on<LoadEvent>((event, emit) async {
      try {
        _cities = _getCitiesUseCase();
        _selectedCity = _cities.first;

        emit(IdleState(
          cities: _cities,
          selectedCity: _selectedCity,
        ));
      } catch (_) {
        emit(IdleState(
          cities: _cities,
          selectedCity: _selectedCity,
        ));
      }
    });

    on<ChangeCityEvent>((event, emit) async {
      if (event.city != null) {
        _selectedCity = event.city!;
      }

      emit(IdleState(
        cities: _cities,
        selectedCity: _selectedCity,
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
