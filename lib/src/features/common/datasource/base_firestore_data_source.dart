import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/common/datasource/local/env_configuration_data_source.dart';

@injectable
class BaseFirestoreDataSource {
  // MARK: - Dependencies
  final EnvConfigurationDataSource _configurationDataSource;

  // MARK: - Life cycle
  BaseFirestoreDataSource({
    required EnvConfigurationDataSource envConfigurationDataSource,
  }) : _configurationDataSource = envConfigurationDataSource;

  // MARK: - FireStore
  FirebaseFirestore _fireStore() {
    return FirebaseFirestore.instance;
  }

  DocumentReference _fireStoreEnv() {
    return _fireStore()
        .collection("Env")
        .doc(_configurationDataSource.firebaseRootPath);
  }

  // MARK: - FirsStore - Event
  CollectionReference eventCollection() {
    return _fireStoreEnv().collection("Event");
  }

  DocumentReference eventReference({required String eventId}) {
    return eventCollection().doc(eventId);
  }

  // MARK: - FirsStore - Event - Participant
  CollectionReference eventParticipantCollection({required String eventId}) {
    return eventReference(eventId: eventId).collection("Participant");
  }

  DocumentReference eventParticipantReference({
    required String eventId,
    required String participantId,
  }) {
    return eventParticipantCollection(eventId: eventId).doc(participantId);
  }

  // MARK: - FirsStore - Event - Guest
  CollectionReference eventGuestCollection({required String eventId}) {
    return eventReference(eventId: eventId).collection("Guest");
  }

  DocumentReference eventGuestReference({
    required String eventId,
    required String guestId,
  }) {
    return eventParticipantCollection(eventId: eventId).doc(guestId);
  }

  // MARK: - FirsStore - Event - Organizer
  CollectionReference eventOrganizerCollection({required String eventId}) {
    return eventReference(eventId: eventId).collection("Organizer");
  }

  DocumentReference eventOrganizerReference({
    required String eventId,
    required String organizerId,
  }) {
    return eventOrganizerCollection(eventId: eventId).doc(organizerId);
  }

  // MARK: - FirsStore - Sport
  CollectionReference sportCollection() {
    return _fireStoreEnv().collection("Sport");
  }

  DocumentReference sportReference(String sportId) {
    return sportCollection().doc(sportId);
  }

  // MARK: - FireStore - User
  CollectionReference userCollection() {
    return _fireStoreEnv().collection("User");
  }

  DocumentReference userReference(String userId) {
    return userCollection().doc(userId);
  }

  CollectionReference userOrganizeEventCollection(String userId) {
    return userReference(userId).collection("OrganizeEvent");
  }

  CollectionReference userParticipateEventCollection(String userId) {
    return userReference(userId).collection("ParticipateEvent");
  }

  CollectionReference userNotificationsCollection(String userId) {
    return userReference(userId).collection("Notification");
  }

  // MARK: - FireStore - MyHorse
  DocumentReference versionCollection() {
    return _fireStoreEnv().collection("Version").doc("flutter");
  }

  // MARK: - FirebaseStorage
  FirebaseStorage _fireStorage() {
    return FirebaseStorage.instance;
  }

  Reference _fireStorageEnv() {
    return _fireStorage()
        .ref("Env")
        .child(_configurationDataSource.firebaseRootPath);
  }

  Reference _usersStorage() {
    return _fireStorageEnv().child('User');
  }

  Reference userStorage(String userId) {
    return _usersStorage().child(userId);
  }

  // MARK: - Firebase functions
  String createStripePaymentIntent() {
    return "createStripePaymentIntent";
  }
}
