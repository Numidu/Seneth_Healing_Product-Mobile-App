import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationservice {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> init() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User authorized for notifications");
    } else {
      print("User did not accept notifications");
      return;
    }

    String? token = await _firebaseMessaging.getToken();
    print("FCM Token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _saveMessageToFirestore(message);
    });

    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  static Future<void> _saveMessageToFirestore(RemoteMessage message) async {
    if (message.notification != null) {
      await _firestore.collection("notifications").add({
        'title': message.notification!.title ?? "No Title",
        'body': message.notification!.body ?? "No Body",
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("Notification saved to Firestore!");
    }
  }

  static Future<void> _onBackgroundMessage(RemoteMessage message) async {
    print("Background Message: ${message.notification?.title}");
    await _saveMessageToFirestore(message);
  }
}
