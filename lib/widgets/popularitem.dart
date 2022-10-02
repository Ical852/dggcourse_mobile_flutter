import 'package:dggcourses/models/course_model.dart';
import 'package:dggcourses/pages/detail_page.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class PopularItem extends StatelessWidget {

  CourseModel course;

  PopularItem({required this.course});

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

    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => DetailPage(course)
          )
        );
      },
      child: Container(
        width: 180,
        height: 205,
        margin: EdgeInsets.only(right: 12, bottom: 24),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12)
                ),
                image: DecorationImage(
                  image: NetworkImage(course_img+course.img),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "IDR " + formatter(course.price),
                    style: poppinsText.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: green
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    course.title,
                    style: poppinsText.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: black
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 7,),
                  Row(
                    children: [
                      stars(),
                      SizedBox(width: 4,),
                      Text(
                        "(4016)",
                        style: poppinsText.copyWith(
                          fontSize: 10,
                          fontWeight: medium,
                          color: grey2
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}