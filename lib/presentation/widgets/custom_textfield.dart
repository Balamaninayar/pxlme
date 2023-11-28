import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final TextEditingController controller;
  final bool? isPassword;
  final FormFieldValidator validator;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    required this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  void hidePassword() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      height: 70,
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.isPassword! ? isObscure : false,
        style: const TextStyle(
            color: Colors.white, letterSpacing: 1, fontSize: 17),
        decoration: InputDecoration(
          hintText: widget.labelText,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 17),
          suffixIcon: widget.isPassword!
              ? IconButton(
                  onPressed: () {
                    hidePassword();
                  },
                  icon: Icon(
                    !isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                    size: 20,
                  ))
              : null,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
