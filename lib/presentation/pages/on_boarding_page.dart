import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxlme/core/constants/routes_constant.dart';

import '../../config/themes/app_colors.dart';
import '../../config/themes/app_text_styles.dart';
import '../../core/constants/list_constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool isFinalSlide = false;

  void _onPageChange(int pageIndex) => setState(() => _currentPage = pageIndex);

  @override
  Widget build(BuildContext context) {
    isFinalSlide = (_currentPage == ListConstants.onboardingData.length - 1);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appBackgroundColors,
        title: const Text(
          "Pxl Me",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChange,
            children: List.generate(
                ListConstants.onboardingData.length,
                (index) => OnboardingPage(
                    title: ListConstants.onboardingData[_currentPage]["title"]!,
                    description: ListConstants.onboardingData[_currentPage]
                        ["description"]!,
                    color: Colors.black)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "0${_currentPage + 1} / 0${ListConstants.onboardingData.length}",
                    style: const TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (isFinalSlide) {
                        return _markOnboardingAsShownAndNavigate();
                      }
                      return _nextPage();
                    },
                    child: Container(
                      height: 40,
                      width: context.width * 0.37,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isFinalSlide
                              ? AppColors.primaryDarkColor
                              : Colors.transparent),
                      child: Text(
                        !isFinalSlide ? "Next" : 'Start Browsing'.toUpperCase(),
                        style: TextStyle(
                          color: isFinalSlide
                              ? Colors.white
                              : AppColors.primaryDarkColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _markOnboardingAsShownAndNavigate() {
    // Mark onboarding as shown
    // Navigate to the login page
    Get.offNamed(RoutesConstants.signUp);
  }

  void _nextPage() => _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.height * 0.55,
          margin: EdgeInsets.symmetric(
              horizontal: context.width * 0.05, vertical: 10),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://source.unsplash.com/random/600×900/?artwork,photograph"))),
        ),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(
                horizontal: context.width * 0.1, vertical: 10),
            width: double.infinity,
            child: Text(
              title,
              style: AppTextStyle.headers,
            )),
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: context.width * 0.1, vertical: 10),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              style: AppTextStyle.description,
            )),
      ],
    );
  }
}
