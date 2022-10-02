import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/cubit/usercourse_cubit.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:dggcourses/widgets/coursegrid.dart';
import 'package:dggcourses/widgets/custombutton.dart';
import 'package:dggcourses/widgets/profileheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCourses extends StatefulWidget {

  @override
  State<UserCourses> createState() => _UserCoursesState();
}

class _UserCoursesState extends State<UserCourses> {
  var course = true;

  @override
  void initState() {
    super.initState();
    var state = BlocProvider.of<UserCubit>(context).state;
    if (state is UserSuccess) {
      context.read<UsercourseCubit>().getAllUserCourses(user_id: state.user.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget courseContent() {
      return BlocBuilder<UsercourseCubit, UsercourseState>(
        builder: (context, state) {
          if (state is UsercourseSuccess) {
            return Container(
                margin: EdgeInsets.only(top: 100, left: 24, right: 24),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "All of Your Course",
                      style: poppinsText.copyWith(
                          fontSize: 22, fontWeight: semiBold, color: black),
                    ),
                    Text(
                      "Choose what you want to learn",
                      style: poppinsText.copyWith(
                          fontSize: 14, fontWeight: light, color: grey),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 157 / 205,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 12,
                      children:state.usercourses.map((usercourse) => CourseGridItem(course: usercourse.course, type: "paid",)).toList(),
                    )
                  ],
                ));
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    Widget myCourses() {
      return Stack(
        children: [
          ProfileHeader(title: "My Courses"),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                text: "Buy More Course",
                onPress: () {},
              ),
            ),
          ),
          courseContent()
        ],
      );
    }

    Widget emptyCourses() {
      return Container(
        child: Column(
          children: [
            ProfileHeader(title: "My Courses"),
            Container(
              margin: EdgeInsets.only(top: 100),
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/emptycourse.png"))),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "No Course Yet",
              style: poppinsText.copyWith(
                  fontSize: 20, fontWeight: semiBold, color: black),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: 182,
              child: Text(
                "Seems like you have not purhcased any course yet",
                style: poppinsText.copyWith(
                    fontSize: 14, fontWeight: light, color: grey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              child: AuthButton(
                text: "Buy Course",
                onPress: () {
                  Navigator.pushNamed(context, "/main-page");
                },
              ),
            )
          ],
        ),
      );
    }

    Widget renderContent() {
      return course ? myCourses() : emptyCourses();
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: renderContent(),
      ),
    );
  }
}
