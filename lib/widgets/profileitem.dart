import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileSettingsItem extends StatelessWidget {

  int ptype;
  String title;
  String subtitle;
  String img;

  ProfileSettingsItem({required this.ptype, required this.title, required this.subtitle, required this.img});

  @override
  Widget build(BuildContext context) {

    double renderHeigt() {
      return ptype == 1 ? 20 :
            ptype == 2 ? 25 :
            ptype == 3 ? 22 :
            ptype == 4 ? 20 : 21;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16
      ),
      height: 76,
      margin: EdgeInsets.only(
        bottom: 16
      ),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(14)
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Color(0xffF8F9FC),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  blurRadius: 2,
                  offset: Offset(0, 2))
              ],
              borderRadius: BorderRadius.circular(14)
            ),
            child: Center(
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img)
                  )
                ),
              ),
            ),
          ),
          SizedBox(width: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
              SizedBox(height: 4,),
              Text(
                subtitle,
                style: poppinsText.copyWith(
                  fontSize: 12,
                  fontWeight: reguler,
                  color: black
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            width: 26,
            height: renderHeigt(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/ic_right.png")
              )
            ),
          )
        ],
      ),
    );
  }
}