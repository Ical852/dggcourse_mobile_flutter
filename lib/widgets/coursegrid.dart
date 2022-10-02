import 'package:dggcourses/models/course_model.dart';
import 'package:dggcourses/models/user_course_model.dart';
import 'package:dggcourses/pages/detail_page.dart';
import 'package:dggcourses/pages/paidcourse.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class CourseGridItem extends StatelessWidget {

  CourseModel course;
  String type;

  CourseGridItem({
    this.type = "original",
    required this.course,
  });

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

    Widget renderprice() {
      return type == "original" || type =="paid" ?
      Text(
        "IDR. " + formatter(course.price),
        style: poppinsText.copyWith(
          fontSize: 12,
          fontWeight: semiBold,
          color: green
        ),
      ) : 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "IDR. " + formatter(course.price),
            style: poppinsText.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
              color: green
            ),
          ),
          Container(
            width: 12,
            height: 14,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/ic_fav_black.png")
              )
            ),
          )
        ],
      );
    }

    return GestureDetector(
      onTap: (){
        if (type == "paid") {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => PaidCourse(course)
            )
          );
        } else {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => DetailPage(course)
            )
          );

        }
        
      },
      child: Container(
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
              height: 125,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(course_img + course.img),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12)
                )
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  renderprice(),
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
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      stars(),
                      SizedBox(width: 4,),
                      Text(
                        course.category.total_course.toString(),
                        style: poppinsText.copyWith(
                          fontSize: 12,
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