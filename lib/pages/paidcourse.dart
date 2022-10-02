import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/models/course_model.dart';
import 'package:dggcourses/pages/mentorpage.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/headerdetail.dart';
import 'package:dggcourses/widgets/lessonsitem.dart';
import 'package:dggcourses/widgets/reviewitem.dart';
import 'package:dggcourses/widgets/toolsitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaidCourse extends StatefulWidget {

  CourseModel course;
  PaidCourse(this.course);

  @override
  State<PaidCourse> createState() => _PaidCourseState();
}

class _PaidCourseState extends State<PaidCourse> {
  TextEditingController reviewController = TextEditingController(text: "");

  var currentMaterial = "about";
  var fokus = false;
  List<Map<String, String>> givereviews = [];

  @override
  Widget build(BuildContext context) {

    Widget chatSender() {
      return Container(
        margin: EdgeInsets.only(top: 50),
            child: Row(
          children: [
            Expanded(
                child: Container(
              height: 45,
              margin: EdgeInsets.only(bottom: 16, left: 16),
              decoration: BoxDecoration(
                  color: Color(0xffEDEEF0),
                  borderRadius: BorderRadius.circular(10)),
              child: Focus(
                onFocusChange: (hasFocus) => {
                  if (hasFocus)
                    {
                      this.setState(() {
                        fokus = true;
                      })
                    }
                  else
                    {
                      this.setState(() {
                        fokus = false;
                      })
                    }
                },
                child: TextFormField(
                  controller: reviewController,
                  autofocus: fokus,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(14),
                      hintStyle: poppinsText.copyWith(
                          fontSize: 14, fontWeight: reguler, color: grey),
                      hintText: "Send a Review"),
                ),
              ),
            )),
            Container(
              width: 45,
              height: 45,
              margin: EdgeInsets.only(bottom: 16, left: 10),
              decoration: BoxDecoration(
                  color: fokus ? primaryColor : Color(0xffEDEEF0),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    var state = BlocProvider.of<UserCubit>(context).state;
                    var userimg = "";
                    var name = "";
                    if (state is UserSuccess) {
                      userimg = state.user.img;
                      name = state.user.full_name;
                    }
                    List<Map<String, String>> array = [];
                      for (var item in givereviews) {
                        array.add(item);
                      }
                      array.add({
                        "text": reviewController.text,
                        "img": userimg,
                        "full_name" : name
                      });

                      this.setState(() {
                        givereviews = array;
                      });

                      this.reviewController = TextEditingController(text: "");
                      FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    width: 19,
                    height: 16,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(fokus
                                ? "assets/ic_send_active.png"
                                : "assets/ic_send_grey.png"))),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 24,
            )
          ],
        ));
    }

    Widget courseMaterialItem(title, selected) {
      return Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 12
        ),
        decoration: BoxDecoration(
          color: selected ? blue3 : white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 1,
              offset: Offset(0, 1))
          ]
        ),
        child: Text(
          title,
          style: poppinsText.copyWith(
            fontSize: 12,
            fontWeight: reguler,
            color: selected ? primaryColor : black
          ),
        ),
      );
    }

    Widget courseMaterial() {
      return Container(
        margin: EdgeInsets.only(
          top: 24
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 24,),
              GestureDetector(
                onTap: () {
                  this.setState(() {
                    currentMaterial = "about";
                  });
                },
                child: courseMaterialItem(
                  "About",
                  currentMaterial == "about"
                ),
              ),
              GestureDetector(
                onTap: () {
                  this.setState(() {
                    currentMaterial = "lessons";
                  });
                },
                child: courseMaterialItem(
                  "Lesson",
                  currentMaterial == "lessons"
                ),
              ),
              GestureDetector(
                onTap: () {
                  this.setState(() {
                    currentMaterial = "tools";
                  });
                },
                child: courseMaterialItem(
                  "Tools",
                  currentMaterial == "tools"
                ),
              ),
              GestureDetector(
                onTap: () {
                  this.setState(() {
                    currentMaterial = "resource";
                  });
                },
                child: courseMaterialItem(
                  "Resource",
                  currentMaterial == "resource"
                ),
              ),
              GestureDetector(
                onTap: () {
                  this.setState(() {
                    currentMaterial = "reviews";
                  });
                },
                child: courseMaterialItem(
                  "Reviews",
                  currentMaterial == "reviews"
                ),
              ),
              SizedBox(width: 12,)
            ],
          ),
        ),
      );
    }

    Widget about() {
      return Container(
        margin: EdgeInsets.only(
          top: 12,
          left: 24,
          right: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Course About",
              style: poppinsText.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 12,),
            Text(
              widget.course.desc,
              style: poppinsText.copyWith(
                fontSize: 12,
                fontWeight: reguler,
                color: grey
              ),
            ),
          ],
        ),
      );
    }

    Widget lessons() {
      return Container(
        margin: EdgeInsets.only(
          top: 12,
          left: 24,
          right: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Course List",
              style: poppinsText.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
                color: black
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 6
              ),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                    color: black.withOpacity(0.2),
                    blurRadius: 2,
                    offset: Offset(0, 2))
              ],
              borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: widget.course.lessons
                    .map((lesson) => LessonsItem(
                        number: lesson.number,
                        title: lesson.title,
                        time: lesson.time))
                    .toList(),
              ),
            ),
            SizedBox(height: 120,)
          ],
        ),
      );
    }

    Widget specialtools() {
      return Container(
        margin: EdgeInsets.only(
          top: 12,
          left: 24
        ),
        child: Text(
          "Tools Needed",
          style: poppinsText.copyWith(
            fontSize: 12,
            fontWeight: semiBold,
            color: black
          ),
        ),
      );
    }

    Widget tools() {
      return Container(
        margin: EdgeInsets.only(
          top: 13,
          left: 24,
          right: 24
        ),
        child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 150/62,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: widget.course.tools
              .map((tool) => ToolsItem(img: tool.img, title: tool.title))
              .toList(),
        ),
      );
    }

    Widget resource() {
      return Container(
        margin: EdgeInsets.only(top: 12, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Course Resource",style: poppinsText.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
                color: black
              ),),
            Container(
              margin: EdgeInsets.only(top: 6),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(0.2),
                        blurRadius: 2,
                        offset: Offset(0, 2))
                  ],
                  borderRadius: BorderRadius.circular(12)),
                child: Column(
                children: widget.course.resources
                    .map((resource) => LessonsItem(
                        number: resource.number,
                        title: resource.title,
                        time: resource.source))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget reviews() {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 24,
                right: 24
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Course Review",
                    style: poppinsText.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: black
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          this.setState(() {
                            fokus = !fokus;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 27
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: Text(
                              "Review +",
                              style: poppinsText.copyWith(
                                fontSize: 10,
                                fontWeight: medium,
                                color: white
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      GestureDetector(
                        onTap: (){
                          this.setState(() {
                            fokus = !fokus;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 27
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: Text(
                              "Rate +",
                              style: poppinsText.copyWith(
                                fontSize: 10,
                                fontWeight: medium,
                                color: white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: widget.course.reviews
                    .map((review) => ReviewItem(
                          desc: review.text,
                          img: review.user.img,
                          name: review.user.full_name,
                        ))
                    .toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: givereviews
                    .map((review) => ReviewItem(
                          desc: review['text'].toString(),
                          img: review['img'].toString(),
                          name: review['full_name'].toString(),
                        ))
                    .toList(),
              ),
            ),
            fokus ? chatSender(): SizedBox(height: 150,)
          ],
        ),
      );
    }

    Widget renderMaterial() {
      return currentMaterial == "about" ? about() :
            currentMaterial == "lessons" ? lessons() :
            currentMaterial == "tools" ? tools() : 
            currentMaterial == "resource" ? resource() : reviews();
    }

    Widget mentor() {
      return GestureDetector(
        onTap: (){
          Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => MentorPage(widget.course.mentor)
          )
        );
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 12,
            left: 24,
            right: 24
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(mentor_img + widget.course.mentor.img),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
              SizedBox(width: 6,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.course.mentor.name,
                    style: poppinsText.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: black
                    ),
                  ),
                  Text(
                    widget.course.mentor.job,
                    style: poppinsText.copyWith(
                      fontSize: 10,
                      fontWeight: medium,
                      color: grey2
                    ),
                  )
                ],
              ),
              Spacer(),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/ic_right.png")
                  )
                ),
              )
            ],
          ),
        ),
      );
    }
    
    Widget content() {
      return Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            HeaderDetail(title: "Course Details"),
            Container(
              height: 227,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24
              ),
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 2))
                ],
                borderRadius: BorderRadius.circular(12)
              ),
              child: Stack(
                children: [
                  Container(
                    height: 203,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(course_img + widget.course.img),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/ic_btn_play.png")
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 12,
                left: 24
              ),
              child: Text(
                widget.course.title,
                style: poppinsText.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
            ),
            mentor(),
            courseMaterial(),
            currentMaterial == "tools" ? specialtools() : SizedBox(),
            renderMaterial()
          ],
        ),
      );
    }

    

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            content(),
          ],
        ),
      ),
    );
  }
}