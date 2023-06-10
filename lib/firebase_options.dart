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
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAyRli9CgVzxcgnGlfheg-Ckqy4V1in9pM',
    appId: '1:922026563911:web:793f9c65733e652bab9462',
    messagingSenderId: '922026563911',
    projectId: 'munchmate-9ad84',
    authDomain: 'munchmate-9ad84.firebaseapp.com',
    storageBucket: 'munchmate-9ad84.appspot.com',
    measurementId: 'G-JWZ0KMPGBS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzANKTHGN0rn0D9hJCF4vzB4GNLqf3Q_0',
    appId: '1:922026563911:android:e25f3ae8fb644867ab9462',
    messagingSenderId: '922026563911',
    projectId: 'munchmate-9ad84',
    storageBucket: 'munchmate-9ad84.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbIRRDeolbZHNmEOoS-A8VtUPRBQutMaQ',
    appId: '1:922026563911:ios:689da8aab74aa416ab9462',
    messagingSenderId: '922026563911',
    projectId: 'munchmate-9ad84',
    storageBucket: 'munchmate-9ad84.appspot.com',
    androidClientId: '922026563911-dg53u13oq537lo3tb84e60823kb7mt50.apps.googleusercontent.com',
    iosClientId: '922026563911-f8n73t3qn66r00491bmpii60ua6ivtti.apps.googleusercontent.com',
    iosBundleId: 'com.vedasjad.munchmate.munchmate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBbIRRDeolbZHNmEOoS-A8VtUPRBQutMaQ',
    appId: '1:922026563911:ios:689da8aab74aa416ab9462',
    messagingSenderId: '922026563911',
    projectId: 'munchmate-9ad84',
    storageBucket: 'munchmate-9ad84.appspot.com',
    androidClientId: '922026563911-dg53u13oq537lo3tb84e60823kb7mt50.apps.googleusercontent.com',
    iosClientId: '922026563911-f8n73t3qn66r00491bmpii60ua6ivtti.apps.googleusercontent.com',
    iosBundleId: 'com.vedasjad.munchmate.munchmate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAyRli9CgVzxcgnGlfheg-Ckqy4V1in9pM',
    appId: '1:922026563911:web:969479462172b752ab9462',
    messagingSenderId: '922026563911',
    projectId: 'munchmate-9ad84',
    authDomain: 'munchmate-9ad84.firebaseapp.com',
    storageBucket: 'munchmate-9ad84.appspot.com',
    measurementId: 'G-2X9VM2G4J2',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyAyRli9CgVzxcgnGlfheg-Ckqy4V1in9pM',
    appId: '1:922026563911:web:5554a94894b7f439ab9462',
    messagingSenderId: '922026563911',
    projectId: 'munchmate-9ad84',
    authDomain: 'munchmate-9ad84.firebaseapp.com',
    storageBucket: 'munchmate-9ad84.appspot.com',
    measurementId: 'G-1075X665KT',
  );
}
