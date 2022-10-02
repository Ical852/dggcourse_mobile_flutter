import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class HeaderDetail extends StatelessWidget {

  String title;

  HeaderDetail({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  blurRadius: 2,
                  offset: Offset(0, 2))
              ],
              borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: 8,
                  height: 12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ic_back_black.png")
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
              color: black
            ),
          ),
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  blurRadius: 2,
                  offset: Offset(0, 2))
              ],
              borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/ic_fav_white.png")
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}