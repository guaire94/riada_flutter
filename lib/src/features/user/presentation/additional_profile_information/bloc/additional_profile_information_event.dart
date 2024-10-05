part of 'additional_profile_information_bloc.dart';

abstract class AdditionalProfileInformationEvent {}

class LoadEvent extends AdditionalProfileInformationEvent {}

class UpdateEvent extends AdditionalProfileInformationEvent {
  final String username;
  final File? imageProfile;
  final String? email;
  final String? phoneNumber;

  UpdateEvent({
    required this.username,
    required this.imageProfile,
    required this.email,
    required this.phoneNumber,
  });
}
