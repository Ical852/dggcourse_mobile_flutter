import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {

  String img;
  String title;
  String cat;

  ArticleTile({required this.img, required this.title, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      height: 80,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          Container(
            width: 86,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article_img+img),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16)
              )
            ),
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 170,
                  child: Text(
                    title,
                    style: poppinsText.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: black
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  cat,
                  style: poppinsText.copyWith(
                    fontSize: 10,
                    fontWeight: medium,
                    color: grey2
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 19),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/ic_love.png")
              )
            ),
          )
        ],
      ),
    );
  }
}