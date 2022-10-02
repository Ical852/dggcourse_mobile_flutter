import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class ToolsItem extends StatelessWidget {

  String img;
  String title;

  ToolsItem({required this.img ,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(tool_img + img)
              )
            ),
          ),
          SizedBox(width: 12,),
          Text(
            title,
            style: poppinsText.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
              color: black
            ),
          )
        ],
      ),
    );
  }
}