import 'package:riada/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:riada/src/features/common/datasource/exceptions/no_more_data_available_exception.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:riada/src/features/event/repository/event_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'event_list_event.dart';
part 'event_list_state.dart';

@injectable
class EventListBloc extends Bloc<EventListEvent, EventListState> {
  // MARK: Properties
  final List _streams = [];

  // MARK: Dependencies
  final EventRepository _eventRepository;

  // MARk: LifeCycle
  EventListBloc({
    required EventRepository eventRepository,
  })  : _eventRepository = eventRepository,
        super(LoadingState()) {
    on<LoadEvent>((event, emit) async {
      try {
        await _eventRepository.loadMore();
        emit(IdleState(
          items: _eventRepository.items,
        ));
      } on NoDataAvailableException catch (_) {
        _eventRepository.reset();
        emit(EmptyState());
      } on NoMoreDataAvailableException catch (_) {
        emit(IdleState(
          items: _eventRepository.items,
        ));
      } catch (_) {
        _eventRepository.reset();
        emit(ErrorState());
      }
    });

    on<RefreshEvent>((event, emit) async {
      _eventRepository.reset();
      add(LoadEvent());
    });
  }

  @override
  Future<void> close() {
    _streams.forEach((stream) => stream.cancel());
    return super.close();
  }
}
