import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:riada/firebase/staging/firebase_options.dart';
import 'package:riada/src/app.dart';
import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/datasource/local/env_configuration_data_source.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies(env: EnvConfiguration.staging);

  await Firebase.initializeApp(
    name: "Riada",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.instance.setAutoInitEnabled(false);

  // Get any initial links
  final PendingDynamicLinkData? initialDeepLink =
      await FirebaseDynamicLinks.instance.getInitialLink();
  runApp(MyApp(
    initialDeepLink: initialDeepLink,
  ));
}
