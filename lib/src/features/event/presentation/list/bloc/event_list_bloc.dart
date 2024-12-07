import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:riada/src/features/event/repository/event_repository.dart';
import 'package:riada/src/utils/constants.dart';

part 'event_list_event.dart';
part 'event_list_state.dart';

@injectable
class EventListBloc extends Bloc<EventListEvent, EventListState> {
  // MARK: Dependencies
  final EventRepository _eventRepository;

  // MARk: LifeCycle
  EventListBloc({
    required EventRepository eventRepository,
  })  : _eventRepository = eventRepository,
        super(LoadingState()) {
    on<LoadEvent>((event, emit) async {
      try {
        final events = await _eventRepository.getNextNearestEvents(
          city: Constants.defaultCity,
        );
        emit(IdleState(
          events: events,
        ));
      } on NoDataAvailableException catch (_) {
        emit(EmptyState());
      } catch (_) {
        emit(ErrorState());
      }
    });

    on<RefreshEvent>((event, emit) async {
      add(LoadEvent());
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
