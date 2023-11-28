import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/routes_constant.dart';
import 'app_routes.dart';
import 'app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pxl.Me',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: AppTheme.theme.value,
      initialRoute: RoutesConstants.splash,
      getPages: AppRoutes.routes,
    );
  }
}
