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
    apiKey: 'AIzaSyBqNLLXxUnWqEI90AdhiQUMNCRZv-tmXnk',
    appId: '1:496632557634:web:b31261b452cc76737b3ddb',
    messagingSenderId: '496632557634',
    projectId: 'mydental-566ed',
    authDomain: 'mydental-566ed.firebaseapp.com',
    storageBucket: 'mydental-566ed.firebasestorage.app',
    measurementId: 'G-GJBF592LE9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwitpZsFq-VqHMFX6rICaV6B5eRUGUHHI',
    appId: '1:496632557634:android:8f21e794053425b17b3ddb',
    messagingSenderId: '496632557634',
    projectId: 'mydental-566ed',
    storageBucket: 'mydental-566ed.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPibG42Vil8k6T28t_OXr-GhcdOr3dlp4',
    appId: '1:496632557634:ios:dfae58b0c491af337b3ddb',
    messagingSenderId: '496632557634',
    projectId: 'mydental-566ed',
    storageBucket: 'mydental-566ed.firebasestorage.app',
    iosBundleId: 'com.example.mymedic',
  );
}
