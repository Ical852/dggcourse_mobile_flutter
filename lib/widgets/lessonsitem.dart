import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class LessonsItem extends StatelessWidget {

  String number;
  String title;
  String time;

  LessonsItem({required this.number, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12
      ),
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: blue3,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Text(
                number,
                style: poppinsText.copyWith(
                  fontSize: 12,
                  fontWeight: semiBold,
                  color: primaryColor
                ),
              ),
            ),
          ),
          SizedBox(width: 14,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                  color: black
                ),
              ),
              Text(
                time,
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: reguler,
                  color: grey2
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}