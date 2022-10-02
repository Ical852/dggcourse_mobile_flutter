import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class PromoItem extends StatelessWidget {

  String color;
  String name;
  String title;
  String bonus;

  PromoItem({required this.color, required this.name, required this.title, required this.bonus});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24),
      padding: EdgeInsets.only(
        top: 19,
        left: 20,
        bottom: 20,
        right: 20
      ),
      width: MediaQuery.of(context).size.width - 48,
      height: 120,
      decoration: BoxDecoration(
        color: color == "blue" ? primaryColor : color == "red" ? red : green,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 64,
            height: 71,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo.png")
              )
            ),
          ),
          SizedBox(
            width: 21,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New User Promo",
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: light,
                  color: white
                ),
              ),
              Text(
                "Top Up DggM 100K",
                style: poppinsText.copyWith(
                  fontSize: 20,
                  fontWeight: medium,
                  color: white
                ),
              ),
              Text(
                "Bonus DggM +150.000",
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                  color: white
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}