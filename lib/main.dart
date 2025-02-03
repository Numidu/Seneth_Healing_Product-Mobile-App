import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:senethhealingfoods/Notification/pushNotification.dart';
import 'package:senethhealingfoods/firebase_options.dart';
import 'package:senethhealingfoods/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await PushNotificationservice.init();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("New Notification: ${message.notification?.title}");

    if (message.notification != null) {
      print("Message Title: ${message.notification!.title}");
      print("Message Body: ${message.notification!.body}");
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterClass().router,
      theme: ThemeData(colorSchemeSeed: Colors.white70),
    );
  }
}
