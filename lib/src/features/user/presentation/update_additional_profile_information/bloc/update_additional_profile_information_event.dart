part of 'update_additional_profile_information_bloc.dart';

abstract class UpdateAdditionalProfileInformationEvent {}

class LoadEvent extends UpdateAdditionalProfileInformationEvent {}

class UpdateEvent extends UpdateAdditionalProfileInformationEvent {
  final File? imageProfile;

  UpdateEvent({
    required this.imageProfile,
  });
}

class DeleteEvent extends UpdateAdditionalProfileInformationEvent {}
