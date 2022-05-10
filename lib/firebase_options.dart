// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDAq8WsCF5ZxyIJCR0CiZY3ezSzKNqMKEQ',
    appId: '1:866349969347:web:86c51647121d9a37a45776',
    messagingSenderId: '866349969347',
    projectId: 'moviedb-firebase',
    authDomain: 'moviedb-firebase.firebaseapp.com',
    storageBucket: 'moviedb-firebase.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfNc42i415jOHTZelfSeF3EynGfJYf1UU',
    appId: '1:866349969347:android:9e9b430431b2db4ca45776',
    messagingSenderId: '866349969347',
    projectId: 'moviedb-firebase',
    storageBucket: 'moviedb-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChhwwEr9QhOnIEVtfUOsJD3Do5ITr3_NE',
    appId: '1:866349969347:ios:e5db449b0b447871a45776',
    messagingSenderId: '866349969347',
    projectId: 'moviedb-firebase',
    storageBucket: 'moviedb-firebase.appspot.com',
    androidClientId: '866349969347-121a1e30ibvlg92cdgvbur5s5jj70amt.apps.googleusercontent.com',
    iosClientId: '866349969347-031fu9pejvthbpc3a4ofjakqfe9g9m2l.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );
}
