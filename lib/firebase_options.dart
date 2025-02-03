// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyApajJDdk70bePblJBDbdCfxN3INoWGV8U',
    appId: '1:1034435989861:web:8fcb9e0e3137c9b6e7918c',
    messagingSenderId: '1034435989861',
    projectId: 'senethhealingfoods',
    authDomain: 'senethhealingfoods.firebaseapp.com',
    storageBucket: 'senethhealingfoods.firebasestorage.app',
    measurementId: 'G-EJTX4LD469',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2bI7Ufqrn6CRRsLLVWcZ2ONP7l1QAov8',
    appId: '1:1034435989861:android:00f2270fc22459bfe7918c',
    messagingSenderId: '1034435989861',
    projectId: 'senethhealingfoods',
    storageBucket: 'senethhealingfoods.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAT1G1uORy2E5QkzOW4TzkaDjAop3_-N88',
    appId: '1:1034435989861:ios:78510671fbe37411e7918c',
    messagingSenderId: '1034435989861',
    projectId: 'senethhealingfoods',
    storageBucket: 'senethhealingfoods.firebasestorage.app',
    iosBundleId: 'com.example.senethhealingfoods',
  );

}