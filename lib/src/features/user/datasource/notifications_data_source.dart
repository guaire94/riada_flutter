import 'dart:convert';

import 'package:template_flutter_app/src/features/common/datasource/base_data_source.dart';
import 'package:template_flutter_app/src/features/user/entity/notification.dart';
import 'package:template_flutter_app/src/features/user/entity/notification_data.dart';
import 'package:template_flutter_app/src/utils/random.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationsDataSource extends BaseDataSource {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future handleNotificationReceived(RemoteMessage message) async {
    final notificationData = NotificationData.fromJson(message.data);
    await _showNotification(message: message, data: notificationData);
  }

  Future requestPermission({
    required Function(NotificationData) onMessageTapped,
  }) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    final initializationSettings = InitializationSettings(
      iOS: DarwinInitializationSettings(),
      android: AndroidInitializationSettings("icon"),
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) async {
      if (details.payload != null) {
        final jsonPayload = json.decode(details.payload!);
        final notificationData = NotificationData.fromJson(jsonPayload);
        onMessageTapped(notificationData);
      }
    });
  }

  Future sendNotification({required Notification notification}) async {
    final notificationId = generateRandomString();
    return userNotificationsCollection(notification.userId)
        .doc(notificationId)
        .set(notification.copyWith(id: notificationId).toJson());
  }

  Future<String?> getInitialDeeplink() async {
    var details = await _flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();

    if (details == null || details.didNotificationLaunchApp == false) {
      return null;
    }

    final payload = details.notificationResponse?.payload;

    if (payload == null) {
      return null;
    }

    final jsonPayload = jsonDecode(payload);
    final data = NotificationData.fromJson(jsonPayload);
    return data.deeplink;
  }

  // MARK: - Private
  _showNotification({
    required RemoteMessage message,
    required NotificationData data,
  }) async {
    try {
      const details = NotificationDetails(
        iOS: DarwinNotificationDetails(
          badgeNumber: 1,
        ),
        android: AndroidNotificationDetails(
          'channel_id',
          'notification_channel',
          importance: Importance.max,
          priority: Priority.max,
          playSound: true,
        ),
      );

      await _flutterLocalNotificationsPlugin.show(
        message.hashCode,
        "Title",
        "Body",
        details,
        payload: json.encode(message.data),
      );
    } catch (_) {}
  }
}
