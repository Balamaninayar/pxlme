import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  // Private constructor for the singleton
  FacebookAuthService._privateConstructor();

  // Singleton instance
  static final FacebookAuthService _instance =
      FacebookAuthService._privateConstructor();

  // Factory constructor to get the instance
  factory FacebookAuthService() {
    return _instance;
  }

  // Perform Facebook login
  Future<LoginResult> login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    return result;
  }

  // Perform Facebook logout
  Future<void> logout() async {
    await FacebookAuth.instance.logOut();
  }

  // Get the user's Facebook data
  Future<Map<String, dynamic>?> getUserData() async {
    final result = await FacebookAuth.instance.getUserData();
    return result;
  }
}
