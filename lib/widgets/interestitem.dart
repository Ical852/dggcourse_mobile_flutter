import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {

  String text;
  Function() onPress;
  bool selected;

  InterestItem({required this.text, required this.onPress, required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 110,
        height: 55,
        margin: EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          color: selected ? primaryColor : white,
          boxShadow: [
            BoxShadow(
                color: black.withOpacity(0.2),
                blurRadius: 2,
                offset: Offset(0,2)
            )
          ],
          borderRadius: BorderRadius.circular(17)
        ),
        child: Center(
          child: Text(
            text,
            style: poppinsText.copyWith(
              fontSize: 16,
              fontWeight: medium,
              color: selected ? white : black
            ),
          )
        ),
      ),
    );
  }
}