import 'package:dggcourses/models/mentor_model.dart';
import 'package:dggcourses/pages/chatpage.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/custombutton.dart';
import 'package:dggcourses/widgets/dotitem.dart';
import 'package:dggcourses/widgets/headeroback.dart';
import 'package:dggcourses/widgets/toggle.dart';
import 'package:flutter/material.dart';

class MentorPage extends StatefulWidget {


  MentorModel mentor;
  MentorPage(this.mentor);

  @override
  State<MentorPage> createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  
  var currentTogle = "left";
  
  @override
  Widget build(BuildContext context) {

    Widget jobitem(title) {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(6)
        ),
        child: Text(
          title
        ),
      );
    }

    Widget mentordata() {
      return Container(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(top: 57),
                height: 100,
                width: 100,
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
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(mentor_img + widget.mentor.img),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(14)
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Text(
                widget.mentor.name,
                style: poppinsText.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                  color: black
                ),
              ),
              Text(
                widget.mentor.job,
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: reguler,
                  color: black
                ),
              ),
              SizedBox(height: 14,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  jobitem("Full Time"),
                  SizedBox(width: 16,),
                  jobitem("Onsite"),
                  SizedBox(width: 16,),
                  jobitem("Senior"),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget description() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About His Job",
              style: poppinsText.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 8,),
            Text(
              widget.mentor.about_job,
              style: poppinsText.copyWith(
                fontSize: 12,
                fontWeight: reguler,
                color: grey
              ),
            ),
            SizedBox(height: 16,),
            Text(
              "Job Responsibilities",
              style: poppinsText.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 8,),
            DotItem(
              title: "At least have 3 years of experience as a UI Designer",
            ),
            DotItem(
              title: "Able to work in a team or individually",
            ),
            DotItem(
              title: "Have a good passion in UI Design",
            ),
            SizedBox(height: 30,),
            CustomButton(
              text: "Start Consultation", 
              onPress: (){
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => ChatPage(widget.mentor)
                  )
                );
              }
            )
          ],
        ),
      );
    }

    Widget company() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About His Company",
              style: poppinsText.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 8,),
            Text(
              widget.mentor.about_company,
              style: poppinsText.copyWith(
                fontSize: 12,
                fontWeight: reguler,
                color: grey
              ),
            ),
            SizedBox(height: 16,),
            Text(
              "Job History",
              style: poppinsText.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 8,),
            DotItem(
              title: "Have 3 years of experience as a UI Designer",
            ),
            DotItem(
              title: "Have 3 years of experience as a UI UX",
            ),
            DotItem(
              title: "Have 3 years of experience as a Mobile Developer",
            ),
            SizedBox(height: 30,),
            CustomButton(
              text: "Start Consultation", 
              onPress: (){
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => ChatPage(widget.mentor)
                  )
                );
              }
            )
          ],
        ),
      );
    }

    Widget renderToggleWidget() {
      return currentTogle == "left" ? description() : company();
    }

    Widget detail() {
      return Container(
        margin: EdgeInsets.only(
          top: 56
        ),
        padding: EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 24
        ),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 2))
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Toggle(
              currentToggle: currentTogle,
              left: "Description",
              right: "Company",
              leftPress: (){
                this.setState(() {
                  currentTogle = "left";
                });
              },
              rightPress: (){
                this.setState(() {
                  currentTogle = "right";
                });
              },
            ),
            SizedBox(height: 24,),
            renderToggleWidget()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SafeArea(
        child: ListView(
          children: [
            HeaderBackOnly(title: "Course Mentor Profile"),
            mentordata(),
            detail()
          ],
        ),
      ),
    );
  }
}