import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  String text;
  Function() onPress;
  bool disable;

  CustomButton({required this.text, required this.onPress, this.disable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: disable ? (){} : onPress,
        child: Text(
          text,
          style: poppinsText.copyWith(
            fontSize: 16,
            fontWeight: medium,
            color: white
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: disable ? primaryColor.withOpacity(0.5):  primaryColor,
          padding: EdgeInsets.symmetric(
            vertical: 22
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          )
        ),
      ),
    );
  }
}