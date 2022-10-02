import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class DotItem extends StatelessWidget {

  String title;

  DotItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/dot.png")
              )
            ),
          ),
          SizedBox(width: 12,),
          Text(
            title,
            style: poppinsText.copyWith(
              fontSize: 12,
              fontWeight: reguler,
              color: grey
            ),
          )
        ],
      ),
    );
  }
}