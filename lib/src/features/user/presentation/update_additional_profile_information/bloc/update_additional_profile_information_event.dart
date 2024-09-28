part of 'update_additional_profile_information_bloc.dart';

abstract class UpdateAdditionalProfileInformationEvent {}

class LoadEvent extends UpdateAdditionalProfileInformationEvent {}

class UpdateEvent extends UpdateAdditionalProfileInformationEvent {
  final File? imageProfile;
  final Place? place;

  UpdateEvent({
    required this.imageProfile,
    required this.place,
  });
}

class DeleteEvent extends UpdateAdditionalProfileInformationEvent {}
