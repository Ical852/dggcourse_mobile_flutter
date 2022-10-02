import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {

  String title;
  bool selected;
  String img;
  Function() onPress;

  MenuItem({required this.title, required this.selected, required this.img, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    img,
                  ),
                )
              ),
            ),
    
            SizedBox(height: 2,),
            Text(
              title,
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: medium,
                color: selected ? primaryColor : blue3
              ),
            )
          ],
        ),
      ),
    );
  }
}