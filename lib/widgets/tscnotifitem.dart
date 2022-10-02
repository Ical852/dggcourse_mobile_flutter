import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class TscNotifItem extends StatelessWidget {

  String title;
  String desc;
  String date;
  String status;
  String textStat;

  TscNotifItem({
    required this.title, 
    required this.desc, 
    required this.date, 
    required this.status,
    required this.textStat
  });

  @override
  Widget build(BuildContext context) {

    Widget renderStatus() {
      return status == "Success" ? 
      Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: green,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/ic_check.png")
              )
            ),
          ),
        ),
      ) :
      Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/ic_cross.png")
              )
            ),
          ),
        ),
      );
    }
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
                margin: EdgeInsets.only(top: 12),
                width: MediaQuery.of(context).size.width - 48 - 24 - 15 - 37 - 12 - 24,
                child: Text(
                  desc,
                  style: poppinsText.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    color: textStat == "success" ? green : textStat == "midtrans"? black : red
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  renderStatus(),
                  SizedBox(width: 8,),
                  Text(
                    status,
                    style: poppinsText.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: status == "Success" ? green : red
                    ),
                  ),
                ],
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