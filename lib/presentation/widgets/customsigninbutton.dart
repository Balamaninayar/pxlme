import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      this.backGroundColor = Colors.grey,
      required this.title,
      required this.onPressed,
      this.textColor = Colors.black})
      : super(key: key);
  final Color? backGroundColor;
  final String title;
  final Color? textColor;
  final Function onPressed;

  @override
  State<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: widget.backGroundColor,
        ),
        width: context.width * 0.7,
        alignment: Alignment.center,
        child: Text(
          widget.title,
          style: TextStyle(
              color: widget.textColor,
              fontSize: 18,
              fontFamily: 'Helvetica Neue',
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
