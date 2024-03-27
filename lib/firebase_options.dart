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
    apiKey: 'AIzaSyDS3j-CMSCcSuxYQuHcfPS3CpWYEi9jX0k',
    appId: '1:980751056768:web:f91029a840ca05f6684b65',
    messagingSenderId: '980751056768',
    projectId: 'fyp-2024-8c9c0',
    authDomain: 'fyp-2024-8c9c0.firebaseapp.com',
    storageBucket: 'fyp-2024-8c9c0.appspot.com',
    measurementId: 'G-DT4GJ6H6MR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzev_DA8knENcV4UX4WxP5qN7gYgVvs9g',
    appId: '1:980751056768:android:1028936e66c5af82684b65',
    messagingSenderId: '980751056768',
    projectId: 'fyp-2024-8c9c0',
    storageBucket: 'fyp-2024-8c9c0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4w2dgTOQ6NT3Vf2vG_-5jnOVWcA-5ldY',
    appId: '1:980751056768:ios:a2bf8617b0be7ae4684b65',
    messagingSenderId: '980751056768',
    projectId: 'fyp-2024-8c9c0',
    storageBucket: 'fyp-2024-8c9c0.appspot.com',
    iosBundleId: 'com.example.doctor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4w2dgTOQ6NT3Vf2vG_-5jnOVWcA-5ldY',
    appId: '1:980751056768:ios:c9bafe425e344b09684b65',
    messagingSenderId: '980751056768',
    projectId: 'fyp-2024-8c9c0',
    storageBucket: 'fyp-2024-8c9c0.appspot.com',
    iosBundleId: 'com.example.doctor.RunnerTests',
  );
}
