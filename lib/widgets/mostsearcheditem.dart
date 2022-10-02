import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class MostSearchedItem extends StatelessWidget {

  String text;

  MostSearchedItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      margin: EdgeInsets.only(
        right: 24
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 22
      ),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(
          color: Color(0xffF1F1F1)
        ),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Center(child: 
      Text(
        text,
        style: poppinsText.copyWith(
          fontSize: 14,
          fontWeight: reguler,
          color: black
        ),
      )),
    );
  }
}