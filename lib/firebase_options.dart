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
    apiKey: 'AIzaSyAHCjEd5LrCfVZ-MDjL4CorZQ9MMrVGPKc',
    appId: '1:562105350025:web:d4eb95329796efbec5d358',
    messagingSenderId: '562105350025',
    projectId: 'flutter-chat-app-5080c',
    authDomain: 'flutter-chat-app-5080c.firebaseapp.com',
    storageBucket: 'flutter-chat-app-5080c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHM6-2Y9rxASq_SsAv32msxH0VRQtC3A8',
    appId: '1:562105350025:android:eb32c0b4ca6bdb14c5d358',
    messagingSenderId: '562105350025',
    projectId: 'flutter-chat-app-5080c',
    storageBucket: 'flutter-chat-app-5080c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9XIDplZb36qWuY8ydJZjJV7ffLyrdJk4',
    appId: '1:562105350025:ios:2999e0a757717730c5d358',
    messagingSenderId: '562105350025',
    projectId: 'flutter-chat-app-5080c',
    storageBucket: 'flutter-chat-app-5080c.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9XIDplZb36qWuY8ydJZjJV7ffLyrdJk4',
    appId: '1:562105350025:ios:dc764dcdeeb348f7c5d358',
    messagingSenderId: '562105350025',
    projectId: 'flutter-chat-app-5080c',
    storageBucket: 'flutter-chat-app-5080c.appspot.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
