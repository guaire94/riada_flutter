import 'dart:io';

import 'package:template_flutter_app/src/features/common/entity/google_place/place.dart';
import 'package:template_flutter_app/src/features/user/entity/user.dart';
import 'package:template_flutter_app/src/features/user/event_bus/user_log_state_updated_event.dart';
import 'package:template_flutter_app/src/features/user/repository/user_repository.dart';
import 'package:template_flutter_app/src/utils/app_event_bus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'update_additional_profile_information_event.dart';
part 'update_additional_profile_information_state.dart';

@injectable
class UpdateAdditionalProfileInformationBloc extends Bloc<
    UpdateAdditionalProfileInformationEvent,
    UpdateAdditionalProfileInformationState> {
  final UserRepository _userRepository;

  UpdateAdditionalProfileInformationBloc(
    UserRepository userRepository,
  )   : this._userRepository = userRepository,
        super(LoadingState()) {
    on<LoadEvent>(_onLoad);
    on<UpdateEvent>(_onUpdate);
    on<DeleteEvent>(_onDelete);
  }

  Future<void> _onLoad(
    LoadEvent event,
    Emitter<UpdateAdditionalProfileInformationState> emit,
  ) async {
    try {
      final user = await _userRepository.getCurrentUser();

      emit(IdleState(user: user));
    } catch (e) {
      emit(ErrorState());
    }
  }

  Future<void> _onUpdate(
    UpdateEvent event,
    Emitter<UpdateAdditionalProfileInformationState> emit,
  ) async {
    try {
      final user = await _userRepository.getCurrentUser();

      emit(IdleState(onSubmitLoading: true, user: user));

      if (event.imageProfile != null) {
        await _userRepository.updateProfilePicture(
          profile: event.imageProfile!,
        );
      }
      if (event.place != null) {
        await _userRepository.updateCity(place: event.place!);
      }
      AppEventBus.instance.fire(UserLogStateUpdatedEvent());
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState());
    }
  }

  Future<void> _onDelete(
    DeleteEvent event,
    Emitter<UpdateAdditionalProfileInformationState> emit,
  ) async {
    try {
      await _userRepository.desactiveAccount();
      AppEventBus.instance.fire(UserLogStateUpdatedEvent());
      emit(DeleteSuccessState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
