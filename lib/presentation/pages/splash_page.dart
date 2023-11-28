import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/key_constants.dart';
import '../../core/constants/routes_constant.dart';
import '../../core/services/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkOnboardingStatus() async {
    final onboardingShown =
        LocalStorage().getString(KeyConstants.ON_BOARDING_SHOWN);
    if (onboardingShown == 'true') {
      navigateToHomeScreen();
    } else {
      navigateToOnboardingScreen();
    }
  }

  void navigateToHomeScreen() => Get.offNamed(RoutesConstants.root);

  void navigateToOnboardingScreen() => Get.offNamed(RoutesConstants.onboarding);

  double fontSize = 25.0; // Initial font size
  Duration animationDuration = const Duration(seconds: 3); // 3 seconds duration

  @override
  void initState() {
    super.initState();

    // Start the animation when the widget is initialized
    Future.delayed(Duration.zero, () {
      animateTextScale();
    });
  }

  void animateTextScale() {
    setState(() {
      fontSize = 50.0; // Final font size
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      checkOnboardingStatus();
    });

    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: animationDuration,
          curve: Curves.easeInOut,
          child: Text(
            'Pxl Me',
            style: TextStyle(fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
