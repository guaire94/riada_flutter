import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/common/entity/google_place/place.dart';
import 'package:riada/src/features/common/repository/sport_repository.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:riada/src/features/event/entity/sport.dart';
import 'package:riada/src/features/event/event_bus/event_added_event.dart';
import 'package:riada/src/features/event/repository/event_repository.dart';
import 'package:riada/src/utils/app_event_bus.dart';

part 'add_event_event.dart';
part 'add_event_state.dart';

@injectable
class AddEventBloc extends Bloc<AddEventEvent, AddEventState> {
  // MARK: - Dependencies
  final SportRepository _sportRepository;
  final EventRepository _eventRepository;

  // MARK: - Properties
  late List<Sport> _sports;
  late Sport _selectedSport;
  late String _selectedCover;

  // MARk: LifeCycle
  AddEventBloc({
    required SportRepository sportRepository,
    required EventRepository eventRepository,
  })  : _sportRepository = sportRepository,
        _eventRepository = eventRepository,
        super(LoadingState()) {
    on<LoadEvent>((event, emit) async {
      _sports = _sportRepository.sports;
      _selectedSport = _sports.first;
      _selectedCover = _selectedSport.covers.first;
      emit(IdleState(
        selectedSport: _selectedSport,
        selectedCover: _selectedCover,
        sports: _sports,
      ));
    });

    on<ChangeSportEvent>((event, emit) async {
      _selectedSport = event.sport;
      _selectedCover = _selectedSport.covers.first;
      emit(IdleState(
        selectedSport: _selectedSport,
        selectedCover: _selectedCover,
        sports: _sports,
      ));
    });

    on<ChangeSportCoverEvent>((event, emit) async {
      _selectedCover = event.cover;
      emit(IdleState(
        selectedSport: _selectedSport,
        selectedCover: _selectedCover,
        sports: _sports,
      ));
    });

    on<SubmitEvent>((event, emit) async {
      try {
        emit(IdleState(
          selectedSport: _selectedSport,
          selectedCover: _selectedCover,
          sports: _sports,
          onConfirmLoading: true,
        ));

        final Event eventModel = Event.toNewEvent(
          sport: _selectedSport,
          cover: _selectedCover,
          title: event.title,
          description: event.description,
          price: double.parse(event.price),
          place: event.place,
          date: Timestamp.fromDate(
            DateTime(
              event.date.year,
              event.date.month,
              event.date.day,
              event.time.hour,
              event.time.minute,
            ),
          ),
          isPrivate: event.isPrivate,
        );
        _eventRepository.add(
          event: eventModel,
          isOrganizerParticipate: event.organizerIsParticipate,
        );
        AppEventBus.instance.fire(EventAddedEvent());
        emit(SuccessState());
      } catch (_) {
        emit(ErrorState());
      }
    });
  }
}
