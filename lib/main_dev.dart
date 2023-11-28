import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/app.dart';
import 'config/app_theme.dart';
import 'core/constants/key_constants.dart';
import 'core/services/local_storage.dart';

import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    dotenv.load(fileName: "dev.env"),
    LocalStorage().init(),
    AppTheme.initTheme()
  ]);
  Stripe.publishableKey = KeyConstants.PUBLIC_KEY!;
  runApp(const App());
}
