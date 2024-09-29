import 'package:riada/src/features/event/entity/event.dart';
import 'package:riada/src/features/event/repository/event_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'event_details_event.dart';
part 'event_details_state.dart';

@injectable
class EventDetailsBloc extends Bloc<EventDetailsEvent, EventDetailsState> {
  // MARK: Dependency
  final EventRepository _eventRepository;

  // MARk: LifeCycle
  EventDetailsBloc({
    required EventRepository eventRepository,
  })  : _eventRepository = eventRepository,
        super(LoadingState()) {
    on<LoadEvent>((e, emit) async {
      try {
        final event = await _eventRepository.getEventFrom(
          eventId: e.eventId,
        );
        emit(IdleState(
          event: event,
        ));
      } catch (_) {
        emit(ErrorState());
      }
    });
  }
}
