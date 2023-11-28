import 'dart:developer';

import 'package:twitter_login/twitter_login.dart';

class TwitterAuthService {
  final twitterLogin = TwitterLogin(
      apiKey: 'YZ5blTfcXDxk3RAcZg0YHpTSO',
      apiSecretKey: 'OhihcQCA76ntK4PzneOJ0NnSWhMFiV5Jv8U35gSdWAh07zHePU',
      redirectURI: 'pxlme://');

  Future<void> loginWithTwitter() async {
    final authResult = await twitterLogin.login();
    log(authResult.authToken.toString());
    log(authResult.authTokenSecret.toString());
  }
}
