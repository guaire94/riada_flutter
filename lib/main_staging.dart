import 'package:template_flutter_app/firebase/staging/firebase_options.dart';
import 'package:template_flutter_app/src/app.dart';
import 'package:template_flutter_app/src/factory/di.dart';
import 'package:template_flutter_app/src/features/common/datasource/local/env_configuration_data_source.dart';
import 'package:template_flutter_app/src/features/user/datasource/notifications_data_source.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

final notificationsDataSource = NotificationsDataSource();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  notificationsDataSource.handleNotificationReceived(message);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies(env: EnvConfiguration.staging);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.instance.setAutoInitEnabled(false);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Get any initial links
  final PendingDynamicLinkData? initialDeepLink =
      await FirebaseDynamicLinks.instance.getInitialLink();
  runApp(MyApp(
    initialDeepLink: initialDeepLink,
  ));
}
