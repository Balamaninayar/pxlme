import 'package:get/get.dart';

import '../core/constants/routes_constant.dart';
import '../presentation/pages/auth/login_page.dart';
import '../presentation/pages/auth/sign_up_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/image_detail_page.dart';
import '../presentation/pages/on_boarding_page.dart';
import '../presentation/pages/profile_page.dart';
import '../presentation/pages/root_page.dart';
import '../presentation/pages/settings_page.dart';
import '../presentation/pages/splash_page.dart';
import '../presentation/pages/text_page.dart';
import '../presentation/widgets/search_page.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: RoutesConstants.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RoutesConstants.home,
      page: () => const HomePage(),
    ),
    GetPage(
        name: RoutesConstants.imageDetail,
        page: () => const ImageDetailsPage()),
    GetPage(
      name: RoutesConstants.signUp,
      page: () => const SignUpPage(),
    ),
    GetPage(
        name: RoutesConstants.searchField,
        page: () => const SearchField(),
        transition: Transition.fade,
        transitionDuration: Duration.zero),
    GetPage(
      name: RoutesConstants.root,
      page: () => const RootPage(),
    ),
    GetPage(
      name: RoutesConstants.settings,
      page: () => const SettingsPage(),
    ),
    GetPage(
      name: RoutesConstants.profile,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: RoutesConstants.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RoutesConstants.onboarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: RoutesConstants.onboarding,
      page: () => const TestPage(),
    ),
  ];
}
