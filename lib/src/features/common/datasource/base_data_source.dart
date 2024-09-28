import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:template_flutter_app/src/utils/random.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BaseDataSource {
  // MARK: - FireStore
  FirebaseFirestore _fireStore() {
    return FirebaseFirestore.instance;
  }

  // MARK: - FirsStore - Horse
  CollectionReference horseCollection() {
    return _fireStore().collection("Horse");
  }

  DocumentReference horseReference(String horseId) {
    return horseCollection().doc(horseId);
  }

  CollectionReference horseParentsCollection(String horseId) {
    return horseReference(horseId).collection("Parent");
  }

  DocumentReference horseParentsReference({
    required String horseId,
    required String parentId,
  }) {
    return horseParentsCollection(horseId).doc(parentId);
  }

  CollectionReference horseParentsHorseCollection({
    required String path,
  }) {
    return _fireStore().doc(path).collection("Parent");
  }

  DocumentReference horseParentsReferenceWithPath({
    required String path,
    required String parentId,
  }) {
    return horseParentsHorseCollection(path: path).doc(parentId);
  }

  // MARK: - FirsStore - Event
  CollectionReference eventCollection() {
    return _fireStore().collection("Event");
  }

  DocumentReference eventReference(String eventId) {
    return eventCollection().doc(eventId);
  }

  CollectionReference eventParticipantCollection(String eventId) {
    return eventCollection().doc(eventId).collection("EventParticipant");
  }

  DocumentReference eventParticipantReference(
    String eventId,
    String participantId,
  ) {
    return eventParticipantCollection(eventId).doc(participantId);
  }

  CollectionReference eventPriceCollection(String eventId) {
    return eventCollection().doc(eventId).collection("EventPrice");
  }

  DocumentReference eventPriceReference(String eventId, String priceId) {
    return eventPriceCollection(eventId).doc(priceId);
  }

  Query eventParticipantCollectionGroup() {
    return _fireStore().collectionGroup("EventParticipant");
  }

  // MARK: - FireStore - Product
  CollectionReference productCollection() {
    return _fireStore().collection("Product");
  }

  DocumentReference productReference(String productId) {
    return productCollection().doc(productId);
  }

  // MARK: - FireStore - User
  CollectionReference userCollection() {
    return _fireStore().collection("User");
  }

  DocumentReference userReference(String userId) {
    return userCollection().doc(userId);
  }

  CollectionReference userNotificationsCollection(String userId) {
    return userReference(userId).collection("Notification");
  }

  // FirsStore - Company
  CollectionReference companyCollection() {
    return _fireStore().collection("Company");
  }

  DocumentReference companyReference(String companyId) {
    return companyCollection().doc(companyId);
  }

  CollectionReference companyAvailabilitiesCollection(String companyId) {
    return companyReference(companyId).collection("CompanyAvailability");
  }

  // MARK: - FirsStore - Company Service
  CollectionReference companyServiceCollection() {
    return _fireStore().collection("CompanyService");
  }

  DocumentReference companyServiceReference(String serviceId) {
    return companyServiceCollection().doc(serviceId);
  }

  // MARK: - FirsStore - Appointments
  CollectionReference appointmentCollection() {
    return _fireStore().collection("Appointment");
  }

  DocumentReference appointmentReference(String appointmentId) {
    return appointmentCollection().doc(appointmentId);
  }

  // MARK: - FirsStore - Advertising
  CollectionReference advertisingCollection() {
    return _fireStore().collection("Advertising");
  }

  DocumentReference advertisingReference(String advertiseId) {
    return advertisingCollection().doc(advertiseId);
  }

  // FirsStore - MyHorse
  CollectionReference myHorseCollection() {
    return _fireStore().collection("MyHorse");
  }

  DocumentReference myHorseReference(String horseId) {
    return myHorseCollection().doc(horseId);
  }

  // MARK: - FirebaseStorage
  FirebaseStorage _fireStorage() {
    return FirebaseStorage.instance;
  }

  Reference _usersStorage() {
    return _fireStorage().ref('User');
  }

  Reference _horsesStorage() {
    return _fireStorage().ref('Horse');
  }

  Reference _eventsStorage() {
    return _fireStorage().ref('Event');
  }

  Reference _companyServiceStorage() {
    return _fireStorage().ref('CompanyService');
  }

  Reference _productStorage() {
    return _fireStorage().ref('Product');
  }

  Reference userStorage(String userId) {
    return _usersStorage().child(userId);
  }

  Reference horseStorage({required String userId, required String horseId}) {
    return _horsesStorage()
        .child(userId)
        .child(horseId)
        .child(generateRandomString());
  }

  Reference eventStorage({required String companyId, required String eventId}) {
    return _eventsStorage()
        .child(companyId)
        .child(eventId)
        .child(generateRandomString());
  }

  Reference companyServiceStorage({
    required String companyId,
    required String serviceId,
  }) {
    return _companyServiceStorage()
        .child(companyId)
        .child(serviceId)
        .child(generateRandomString());
  }

  Reference productStorage({
    required String userId,
    required String productId,
  }) {
    return _productStorage()
        .child(userId)
        .child(productId)
        .child(generateRandomString());
  }

  // MARK: - Firebase functions
  String createStripePaymentIntent() {
    return "createStripePaymentIntent";
  }

  // MARK: - Stripe
  String _stripeBaseUrl() {
    return "https://api.stripe.com/v1/";
  }

  String stripeConnectAccount() {
    return _stripeBaseUrl() + "accounts";
  }

  String stripeAccountLink() {
    return _stripeBaseUrl() + "account_links";
  }

  String stripeCustomer() {
    return _stripeBaseUrl() + "customers";
  }
}
