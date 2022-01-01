import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return _auth.isDeviceSupported();
    } on PlatformException catch (e) {
      print(e);
      throw (e);
    }
  }

  static Future<bool> authenticate() async {
    final biometricsAvailable = await hasBiometrics();
    if (!biometricsAvailable) {
      print('no biometric');
      return false;
    }
    try {
      return await _auth.authenticate(
        localizedReason: 'Scan Fingerprint to Authenticate',
        biometricOnly: true,
        stickyAuth: true,
        useErrorDialogs: true,
      );
    } on PlatformException catch (error) {
      print(error);
      throw (error);
    }
  }
}
