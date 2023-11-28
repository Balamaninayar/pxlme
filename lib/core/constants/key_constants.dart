// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class KeyConstants {
  static const String ON_BOARDING_SHOWN = 'ON_BOARDING_SHOWN';
  static const String REFRESH_TOKEN_KEY = 'refresh_token';
  static const String BACKEND_TOKEN_KEY = 'backend_token';
  static const String GOOGLE_ISSUER = 'https://accounts.google.com';

  //google keys
  static final String? STRIPE_SECRET_KEY = dotenv.env['STRIPE_SECRET_KEY'];
  static final String? PUBLIC_KEY = dotenv.env['PUBLIC_KEY'];
}
