import 'package:flutter/material.dart';

class CustomTextLink extends StatelessWidget {
  final String text;
  final Function onTap;

  const CustomTextLink({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
