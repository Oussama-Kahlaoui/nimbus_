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
    apiKey: 'AIzaSyDYl6_IoB0vi09SVnfORmWSxt0vXpSk3eI',
    appId: '1:368111517765:web:ed4df5b6a0645c0ad4632c',
    messagingSenderId: '368111517765',
    projectId: 'nimbusdata-7bf1e',
    authDomain: 'nimbusdata-7bf1e.firebaseapp.com',
    storageBucket: 'nimbusdata-7bf1e.appspot.com',
    measurementId: 'G-PDVHNZLJGX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3UkIAP7WRKgGtUyKxt10nUCycZaQ-kAA',
    appId: '1:368111517765:android:2339ef9010ebb7a3d4632c',
    messagingSenderId: '368111517765',
    projectId: 'nimbusdata-7bf1e',
    storageBucket: 'nimbusdata-7bf1e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtUIzXPFjG-ldDgejRLbz7b6HZzV4V3I4',
    appId: '1:368111517765:ios:d772070b03224430d4632c',
    messagingSenderId: '368111517765',
    projectId: 'nimbusdata-7bf1e',
    storageBucket: 'nimbusdata-7bf1e.appspot.com',
    iosBundleId: 'com.example.niimbus',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtUIzXPFjG-ldDgejRLbz7b6HZzV4V3I4',
    appId: '1:368111517765:ios:d772070b03224430d4632c',
    messagingSenderId: '368111517765',
    projectId: 'nimbusdata-7bf1e',
    storageBucket: 'nimbusdata-7bf1e.appspot.com',
    iosBundleId: 'com.example.niimbus',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDYl6_IoB0vi09SVnfORmWSxt0vXpSk3eI',
    appId: '1:368111517765:web:d54604a95dc84880d4632c',
    messagingSenderId: '368111517765',
    projectId: 'nimbusdata-7bf1e',
    authDomain: 'nimbusdata-7bf1e.firebaseapp.com',
    storageBucket: 'nimbusdata-7bf1e.appspot.com',
    measurementId: 'G-Y44XXMWGPR',
  );
}
