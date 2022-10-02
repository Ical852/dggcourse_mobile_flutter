import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class NotifItem extends StatelessWidget {

  String title;
  String desc;
  String date;

  NotifItem({required this.title, required this.desc, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
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
      padding: EdgeInsets.only(
        top: 24,
        bottom: 24,
        left: 24,
        right: 15
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                width: MediaQuery.of(context).size.width - 48 - 24 - 15 - 37 - 12 - 24,
                child: Text(
                  desc,
                  style: poppinsText.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                    color: grey
                  ),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
          SizedBox(width: 24,),
          Text(
            date,
            style: poppinsText.copyWith(
              fontSize: 12,
              fontWeight: light,
              color: grey
            ),
          )
        ],
      ),
    );
  }
}