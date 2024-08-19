import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeiEzoK-t39wxANZDXEigJJ1Y--SCriOU',
    appId: '1:299979159817:android:af42717545d676a2a9bbd8',
    messagingSenderId: '2999791598/17',
    projectId: 'wallet-309d1',
    storageBucket: 'wallet-309d1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1xzLFoXRcwEKxUyWUQhxHl2GsfYbAxwc',
    appId: '1:527713450846:ios:eccee79028a42174cfedcf',
    messagingSenderId: '527713450846',
    projectId: 'quizy-app-59cc2',
    storageBucket: 'quizy-app-59cc2.appspot.com',
    iosBundleId: 'dev.vlab.quizlab',
  );
}
