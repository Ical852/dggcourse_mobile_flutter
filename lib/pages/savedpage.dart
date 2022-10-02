import 'package:dggcourses/cubit/categorycourse_cubit.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:dggcourses/widgets/coursegrid.dart';
import 'package:dggcourses/widgets/promoitem.dart';
import 'package:dggcourses/widgets/stackheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedPage extends StatefulWidget {
  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  var saved = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CategorycourseCubit>().getCategoryCourses(id: "2");
  }

  @override
  Widget build(BuildContext context) {
    Widget emptySaved() {
      return Container(
        margin: EdgeInsets.only(top: 120),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/emptysaved.png"))),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "No Saved Course Yet",
                style: poppinsText.copyWith(
                    fontSize: 20, fontWeight: semiBold, color: black),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: 214,
                child: Text(
                  "Seems like you have not saved any course yet",
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
                  text: "Go to Home",
                  onPress: () {},
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget promo() {
      return Container(
        margin: EdgeInsets.only(top: 35, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Promo New User Top Up",
              style: poppinsText.copyWith(
                  fontSize: 14, fontWeight: semiBold, color: black),
            )
          ],
        ),
      );
    }

    Widget line() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        height: 1,
        color: Color(0xffEEEEEE),
      );
    }

    Widget savedItem() {
      return BlocBuilder<CategorycourseCubit, CategorycourseState>(
        builder: (context, state) {
          if (state is CategorycourseSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 120),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 13,
                mainAxisSpacing: 12,
                childAspectRatio: 157 / 205,
                children: state.courses.map((course) => CourseGridItem(course: course, type: "saved",)).toList(),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    Widget titleSavedItem() {
      return Container(
        margin: EdgeInsets.only(top: 24, left: 24),
        child: Text(
          "All Saved Course",
          style: poppinsText.copyWith(
              fontSize: 14, fontWeight: semiBold, color: black),
        ),
      );
    }

    Widget savedCourse() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            promo(),
            SizedBox(
              height: 12,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  PromoItem(
                    name: "New User Promo",
                    color: "blue",
                    title: "Top Up DggM 100K",
                    bonus: "Bonus DggM +150.000",
                  ),
                  PromoItem(
                    name: "Super Hot Promo",
                    color: "red",
                    title: "Top Up DggM 500K",
                    bonus: "Bonus DggM +500.000",
                  ),
                  PromoItem(
                    name: "Monthly Hot Promo",
                    color: "green",
                    title: "Top Up DggM 250K",
                    bonus: "Get DggM 10K/Day - 30 Days",
                  ),
                ],
              ),
            ),
            line(),
            titleSavedItem()
          ],
        ),
      );
    }

    Widget renderPage() {
      return saved ? savedCourse() : emptySaved();
    }

    return ListView(
      shrinkWrap: true,
      children: [
        StackHeader(
          title: "Saved Course",
        ),
        renderPage(),
        savedItem(),
      ],
    );
  }
}
