import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {

  String img;
  String name;
  String desc;

  ReviewItem({required this.img, required this.name, required this.desc});

  @override
  Widget build(BuildContext context) {

    Widget stars() {
      return Container(
        child: Row(
          children: [
            Container(
              width: 14,
              height: 14,
              margin:EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ic_star.png")
                )
              ),
            ),
            Container(
              width: 14,
              height: 14,
              margin:EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ic_star.png")
                )
              ),
            ),
            Container(
              width: 14,
              height: 14,
              margin:EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ic_star.png")
                )
              ),
            ),
            Container(
              width: 14,
              height: 14,
              margin:EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ic_star.png")
                )
              ),
            ),
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ic_star.png")
                )
              ),
            )
          ],
        ),
      );
    }
    
    return Container(
      margin: EdgeInsets.only(
        bottom: 20
      ),
      padding: EdgeInsets.all(12),
      width: double.infinity,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(user_img + img),
              ),
              borderRadius: BorderRadius.circular(50)
            ),
          ),
          SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: poppinsText.copyWith(
                  fontSize: 12,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 48 - 24 - 36 - 12,
                child: Text(
                  desc,
                  style: poppinsText.copyWith(
                    fontSize: 12,
                    fontWeight: reguler,
                    color: grey
                  ),
                ),
              ),
              SizedBox(height: 12,),
              stars()
            ],
          )
        ],
      ),
    );
  }
}