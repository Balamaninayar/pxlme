import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSocialButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final IconData? icon;
  final Color? textColor;
  final Function onPressed;

  const CustomSocialButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.icon,
    required this.onPressed,
    this.textColor = Colors.black,
  });

  @override
  State<CustomSocialButton> createState() => _CustomSocialButtonState();
}

class _CustomSocialButtonState extends State<CustomSocialButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(),
      child: Container(
        width: context.width * 0.7,
        height: 60,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white)),
        child: Row(
          children: [
            SizedBox(
              width: context.width * 0.13,
              child: widget.icon != null
                  ? Icon(
                      widget.icon,
                      color: widget.textColor,
                    )
                  : const SizedBox(),
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontSize: 17,
                fontFamily: 'Helvetica Neue',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
