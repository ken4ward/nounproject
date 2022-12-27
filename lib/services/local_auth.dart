import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LocalAuth {

  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
    await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try{
      if(! await _canAuthenticate()) return false;
      return await _auth.authenticate(authMessages: const [
        AndroidAuthMessages(
          signInTitle: 'Sign In',
          cancelButton: 'No Thanks'
        ),
        IOSAuthMessages(
          cancelButton: 'No Thanks'
        ),
      ], localizedReason:'Use Face ID for authentication',
      options: const AuthenticationOptions(
        useErrorDialogs: true,
        stickyAuth: true,
      ));
    } catch(e){
      e.toString();
      return false;
    }
  }
}