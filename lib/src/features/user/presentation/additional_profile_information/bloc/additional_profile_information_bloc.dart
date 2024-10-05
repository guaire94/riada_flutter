import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/user/entity/user_status.dart';
import 'package:riada/src/features/user/event_bus/user_log_state_updated_event.dart';
import 'package:riada/src/features/user/repository/user_repository.dart';
import 'package:riada/src/utils/app_event_bus.dart';

part 'additional_profile_information_event.dart';
part 'additional_profile_information_state.dart';

@injectable
class AdditionalProfileInformationBloc extends Bloc<
    AdditionalProfileInformationEvent, AdditionalProfileInformationState> {
  // MARK: Dependencies
  final UserRepository _userRepository;

  // MARK: LifeCycle
  AdditionalProfileInformationBloc({
    required UserRepository userRepository,
  })  : this._userRepository = userRepository,
        super(LoadingState()) {
    on<LoadEvent>(_onLoad);
    on<UpdateEvent>(_onUpdate);
  }

  Future<void> _onLoad(
    LoadEvent event,
    Emitter<AdditionalProfileInformationState> emit,
  ) async {
    emit(IdleState());
  }

  Future<void> _onUpdate(
    UpdateEvent event,
    Emitter<AdditionalProfileInformationState> emit,
  ) async {
    emit(IdleState(
      onSubmitLoading: true,
    ));

    try {
      await _userRepository.updateAdditionalProfileInformation(
        profile: event.imageProfile,
        status: UserStatus.verified,
        name: event.username,
        email: event.email,
        phoneNumber: event.phoneNumber,
      );
      AppEventBus.instance.fire(UserLogStateUpdatedEvent());
      emit(SuccessState());
    } catch (_) {
      emit(IdleState());
      emit(ErrorState());
    }
  }
}
