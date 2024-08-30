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
    apiKey: 'AIzaSyAWBqNIvyCIR4C1Dx3aZoKYA4b6jcGV8Zo',
    appId: '1:223214174678:web:1e8df7f2916573e97c2477',
    messagingSenderId: '223214174678',
    projectId: 'shopatoz-41f3a',
    authDomain: 'shopatoz-41f3a.firebaseapp.com',
    storageBucket: 'shopatoz-41f3a.appspot.com',
    measurementId: 'G-5SF6QLXQTR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwPJoouDaY_Nzpet_ejP3E9vE2P6ntAgA',
    appId: '1:223214174678:android:836a2dbc4b95ab467c2477',
    messagingSenderId: '223214174678',
    projectId: 'shopatoz-41f3a',
    storageBucket: 'shopatoz-41f3a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzHrvCMHiI3HjAM384h4P50-xRK_A876A',
    appId: '1:223214174678:ios:0dafe9cb117f84777c2477',
    messagingSenderId: '223214174678',
    projectId: 'shopatoz-41f3a',
    storageBucket: 'shopatoz-41f3a.appspot.com',
    iosBundleId: 'com.example.shopAz',
  );
}
