// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyD0JUiv1eBqRHIFw_GT2edh2XkSXErAcxE',
    appId: '1:307241067090:web:bf95544e1378026759f58b',
    messagingSenderId: '307241067090',
    projectId: 'fluttercontador',
    authDomain: 'fluttercontador.firebaseapp.com',
    databaseURL: 'https://fluttercontador-default-rtdb.firebaseio.com',
    storageBucket: 'fluttercontador.appspot.com',
    measurementId: 'G-N6QG59YT4M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZEl1-87DDPrDCox1Tm3VxU3Q-kCq7rTw',
    appId: '1:307241067090:android:998776f5b298375d59f58b',
    messagingSenderId: '307241067090',
    projectId: 'fluttercontador',
    databaseURL: 'https://fluttercontador-default-rtdb.firebaseio.com',
    storageBucket: 'fluttercontador.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjgmL4d6wSRMFPlOotjpJ3Qlvdc2wRsbQ',
    appId: '1:307241067090:ios:de335f65b3755b9e59f58b',
    messagingSenderId: '307241067090',
    projectId: 'fluttercontador',
    databaseURL: 'https://fluttercontador-default-rtdb.firebaseio.com',
    storageBucket: 'fluttercontador.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjgmL4d6wSRMFPlOotjpJ3Qlvdc2wRsbQ',
    appId: '1:307241067090:ios:66cbfac9a73b3c6d59f58b',
    messagingSenderId: '307241067090',
    projectId: 'fluttercontador',
    databaseURL: 'https://fluttercontador-default-rtdb.firebaseio.com',
    storageBucket: 'fluttercontador.appspot.com',
    iosBundleId: 'com.example.app.RunnerTests',
  );
}