import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pxlme/presentation/widgets/app_widgets.dart';

import '../../../core/constants/routes_constant.dart';
import '../../../core/services/auth/facebook_auth_service.dart';
import '../../../core/services/auth/google_auth_service.dart';
import '../../../core/services/auth/twitter_auth_service.dart';
import '../../widgets/custom_social_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/customsigninbutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  GoogleSignInService googleSignInService = GoogleSignInService();
  FacebookAuthService facebookAuthService = FacebookAuthService();
  TwitterAuthService twitterAuthService = TwitterAuthService();
  final _formKey = GlobalKey<FormState>();

  void onLogin() {
    // Handle login logic
  }

  void onForgotPassword() {
    // Handle forgot password logic
  }

  void onRegister() {
    // Handle registration logic
  }

  void onGoogleSignIn() async {
    await googleSignInService.signOut();
    await googleSignInService.signInWithGoogle();

    // Handle Google Sign-In logic
  }

  void onFacebookSignIn() {
    facebookAuthService.logout();
    facebookAuthService.login();
    // Handle Facebook Sign-In logic
  }

  void onMicrosoftSignIn() {
    // Handle Microsoft Sign-In logic
  }

  void onTwitterSignIn() async {
    // Handle Twitter Sign-In logic
    await twitterAuthService.loginWithTwitter();
  }

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      Get.offAllNamed(
        RoutesConstants.root,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text('Login'.toUpperCase()),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            socialButtons(context),
            const SizedBox(height: 20),
            AppWidgets.orWidget(context),
            const SizedBox(height: 30),
            SizedBox(
              height: context.height * .35,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextField(
                      labelText: 'Enter your Email',
                      icon: Icons.email,
                      controller: emailController,
                      validator: (email) {
                        if (email.toString().isEmpty) {
                          return 'please enter email';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      labelText: 'Enter your Password',
                      icon: Icons.lock,
                      controller: passwordController,
                      isPassword: true,
                      validator: (password) {
                        if (password.toString().isEmpty) {
                          return 'please enter password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      title: "Login",
                      onPressed: () {
                        handleLogin();
                      },
                      backGroundColor: Colors.white,
                      textColor: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: onForgotPassword,
                      child: const Text(
                        'Forgot your Password ?',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox socialButtons(BuildContext context) {
    return SizedBox(
      height: context.height * 0.35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomSocialButton(
            text: "Continue with Apple",
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icons.apple,
            textColor: Colors.white,
            onPressed: () {},
          ),
          CustomSocialButton(
            text: "Continue with Gmail",
            backgroundColor: Theme.of(context).primaryColor,
            icon: LineIcons.googleLogo,
            textColor: Colors.white,
            onPressed: () {
              onGoogleSignIn();
            },
          ),
          CustomSocialButton(
            text: "Continue with Facebook",
            backgroundColor: Theme.of(context).primaryColor,
            icon: LineIcons.facebookF,
            textColor: Colors.white,
            onPressed: () {
              onFacebookSignIn();
            },
          ),
        ],
      ),
    );
  }
}
