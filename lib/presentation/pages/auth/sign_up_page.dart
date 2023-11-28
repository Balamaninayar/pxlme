import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pxlme/config/themes/app_colors.dart';
import 'package:pxlme/config/themes/app_text_styles.dart';
import 'package:pxlme/core/constants/routes_constant.dart';

import '../../../core/constants/image_constants.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/custom_social_button.dart';
import '../../widgets/customsigninbutton.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.signUpBackground))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.height * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Pxl Me",
                      style: AppTextStyle.headers
                          .copyWith(color: Colors.white, fontSize: 25)),
                  Text(
                    "The future of digital\nart starts here.",
                    style: AppTextStyle.headers
                        .copyWith(color: Colors.white, fontSize: 37),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomSocialButton(
                    text: "Sign up with Email",
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    icon: Icons.email,
                  ),
                  CustomSocialButton(
                    text: "Continue with Apple",
                    backgroundColor: Colors.white,
                    icon: Icons.apple,
                    onPressed: () {},
                  ),
                  CustomSocialButton(
                    text: "Continue with Gmail",
                    backgroundColor: Colors.white,
                    icon: LineIcons.googleLogo,
                    onPressed: () {},
                  ),
                  CustomSocialButton(
                    text: "Continue with Facebook",
                    backgroundColor: Colors.white,
                    icon: LineIcons.facebookF,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppWidgets.orWidget(context),
                  CustomButton(
                    title: "Login",
                    onPressed: () => Get.toNamed(RoutesConstants.login),
                    backGroundColor: AppColors.primaryDarkColor,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
