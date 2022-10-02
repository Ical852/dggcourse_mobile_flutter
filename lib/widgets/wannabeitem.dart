import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class WannaBeItem extends StatelessWidget {

  String title;
  bool selected;
  Function() onPress;

  WannaBeItem({required this.title, required this.selected, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: selected? primaryColor : white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0,2)
            )
          ],
          borderRadius: BorderRadius.circular(17),
        ),
        child: Center(
          child: Text(
            title,
            style: poppinsText.copyWith(
              fontSize: 16,
              fontWeight: medium,
              color: selected ? white :  black
            ),
          ),
        ),
      ),
    );
  }
}