import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {

  String title;

  ProfileHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24
      ),
      height: 76,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: blue1,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.2),
                    blurRadius: 2,
                    offset: Offset(0, 2))
                ],
                borderRadius: BorderRadius.circular(6)
              ),
              child: Center(
                child: Container(
                  width: 8,
                  height: 12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ic_back_white.png")
                    )
                  ),
                ),
              ),
            ),
          ),
          Text(
            title,
            style: poppinsText.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
              color: white
            ),
          ),
          Container(
            width: 26,
            height: 26,
          )
        ],
      ),
    );
  }
}