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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDFfL2tKQRA8wZD2nbd5RIXC01eDezh8hk',
    appId: '1:150643400277:web:50544aa5bafcc6be793edc',
    messagingSenderId: '150643400277',
    projectId: 'yks-app-current',
    authDomain: 'yks-app-current.firebaseapp.com',
    storageBucket: 'yks-app-current.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAaJ222H9YVolUr5dd9xz7ifub5wWvO4aU',
    appId: '1:150643400277:android:14685f58bb5b2c9c793edc',
    messagingSenderId: '150643400277',
    projectId: 'yks-app-current',
    storageBucket: 'yks-app-current.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5klQXzSkWKpibRmRWDZWAcqdNJWHGAg8',
    appId: '1:150643400277:ios:3710b40d474549aa793edc',
    messagingSenderId: '150643400277',
    projectId: 'yks-app-current',
    storageBucket: 'yks-app-current.firebasestorage.app',
    iosBundleId: 'com.example.sprintmap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD5klQXzSkWKpibRmRWDZWAcqdNJWHGAg8',
    appId: '1:150643400277:ios:3710b40d474549aa793edc',
    messagingSenderId: '150643400277',
    projectId: 'yks-app-current',
    storageBucket: 'yks-app-current.firebasestorage.app',
    iosBundleId: 'com.example.sprintmap',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDFfL2tKQRA8wZD2nbd5RIXC01eDezh8hk',
    appId: '1:150643400277:web:9ec6f5a95b0854da793edc',
    messagingSenderId: '150643400277',
    projectId: 'yks-app-current',
    authDomain: 'yks-app-current.firebaseapp.com',
    storageBucket: 'yks-app-current.firebasestorage.app',
  );
}
