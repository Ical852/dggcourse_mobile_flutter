import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class UserChat extends StatelessWidget {
  
  String text;

  UserChat({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
        margin: EdgeInsets.only(right: 16, bottom: 20),
        padding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 15
        ),
        decoration: BoxDecoration(
          color: blue3,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8)
          )
        ),
        child: Text(
          text,
          style: poppinsText.copyWith(
            fontSize: 14,
            fontWeight: reguler,
            color: black
          ),
        ),
      ),
    );
  }
}