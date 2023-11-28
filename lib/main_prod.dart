import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/app.dart';
import 'config/app_theme.dart';
import 'core/services/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    dotenv.load(fileName: "prod.env"),
    LocalStorage().init(),
    AppTheme.initTheme()
  ]);
  runApp(const App());
}
