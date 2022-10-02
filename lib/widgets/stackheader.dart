import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class StackHeader extends StatelessWidget {

  String title;

  StackHeader({required this.title});
  
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
              child: Container(
                width: 16,
                height: 14,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/ic_cat_black.png")
                  )
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
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, "/notif-page");
            },
            child: Container(
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
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ic_notif_black.png")
                    )
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}