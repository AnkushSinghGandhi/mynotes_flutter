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
    apiKey: 'AIzaSyC2HEfI6AiNu3XD-yfyZY7yh1lJVE4QAKo',
    appId: '1:1079468036650:web:239b0c2e483f3d69eba953',
    messagingSenderId: '1079468036650',
    projectId: 'mynotes-ankush-singh',
    authDomain: 'mynotes-ankush-singh.firebaseapp.com',
    storageBucket: 'mynotes-ankush-singh.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2OU5A_qaUNW2_hSoXrLHSW4b2sgH2SrQ',
    appId: '1:1079468036650:android:2327d582c190689feba953',
    messagingSenderId: '1079468036650',
    projectId: 'mynotes-ankush-singh',
    storageBucket: 'mynotes-ankush-singh.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSkmkZjEMjD0CA6TfBhBnYuxSNiMRuu4I',
    appId: '1:1079468036650:ios:6074fe1e06c85b7feba953',
    messagingSenderId: '1079468036650',
    projectId: 'mynotes-ankush-singh',
    storageBucket: 'mynotes-ankush-singh.appspot.com',
    iosClientId: '1079468036650-nan4nds3cpmrc2gt48s35cds2o4uqmel.apps.googleusercontent.com',
    iosBundleId: 'com.ankushgandhi.mynotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDSkmkZjEMjD0CA6TfBhBnYuxSNiMRuu4I',
    appId: '1:1079468036650:ios:6074fe1e06c85b7feba953',
    messagingSenderId: '1079468036650',
    projectId: 'mynotes-ankush-singh',
    storageBucket: 'mynotes-ankush-singh.appspot.com',
    iosClientId: '1079468036650-nan4nds3cpmrc2gt48s35cds2o4uqmel.apps.googleusercontent.com',
    iosBundleId: 'com.ankushgandhi.mynotes',
  );
}
