import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  String text;
  Function() onPress;

  AuthButton({required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: poppinsText.copyWith(
              fontSize: 16, fontWeight: medium, color: white),
        ),
        style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17))),
      ),
    );
  }
}