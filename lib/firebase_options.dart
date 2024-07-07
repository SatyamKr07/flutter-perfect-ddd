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
    apiKey: 'AIzaSyC5oIwDw9h1LTVaMU2LBC7gLEcggynvm28',
    appId: '1:268789551686:web:d702662d2005664691f047',
    messagingSenderId: '268789551686',
    projectId: 'flutter-perfect-ddd',
    authDomain: 'flutter-perfect-ddd.firebaseapp.com',
    storageBucket: 'flutter-perfect-ddd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFbWeb4i_CPxhwi9SNHA8AgbfQunWeLik',
    appId: '1:268789551686:android:5bbf4c79771571ac91f047',
    messagingSenderId: '268789551686',
    projectId: 'flutter-perfect-ddd',
    storageBucket: 'flutter-perfect-ddd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgcx5nsaQFqKKslpRMIhTz35-1DUZaUbc',
    appId: '1:268789551686:ios:e1049a63eac3964391f047',
    messagingSenderId: '268789551686',
    projectId: 'flutter-perfect-ddd',
    storageBucket: 'flutter-perfect-ddd.appspot.com',
    iosBundleId: 'com.example.flutterPerfectDdd',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgcx5nsaQFqKKslpRMIhTz35-1DUZaUbc',
    appId: '1:268789551686:ios:e1049a63eac3964391f047',
    messagingSenderId: '268789551686',
    projectId: 'flutter-perfect-ddd',
    storageBucket: 'flutter-perfect-ddd.appspot.com',
    iosBundleId: 'com.example.flutterPerfectDdd',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC5oIwDw9h1LTVaMU2LBC7gLEcggynvm28',
    appId: '1:268789551686:web:88dbaae0ee9cda1a91f047',
    messagingSenderId: '268789551686',
    projectId: 'flutter-perfect-ddd',
    authDomain: 'flutter-perfect-ddd.firebaseapp.com',
    storageBucket: 'flutter-perfect-ddd.appspot.com',
  );
}
