import 'package:dggcourses/cubit/course_cubit.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/coursegrid.dart';
import 'package:dggcourses/widgets/mostsearcheditem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KatalogPage extends StatefulWidget {
  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CourseCubit>().getAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Interest",
              style: poppinsText.copyWith(
                  fontSize: 12, fontWeight: reguler, color: grey),
            ),
            Row(
              children: [
                Text(
                  "Code, ",
                  style: poppinsText.copyWith(
                      fontSize: 16, fontWeight: semiBold, color: black),
                ),
                Text(
                  "Soft Skill, Design",
                  style: poppinsText.copyWith(
                      fontSize: 16, fontWeight: light, color: black),
                )
              ],
            ),
            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: grey),
                  borderRadius: BorderRadius.circular(100)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 24),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/ic_katalog_search.png"))),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Find your favorite course",
                    style: poppinsText.copyWith(
                        fontSize: 14, fontWeight: reguler, color: grey),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget line() {
      return Container(
        height: 1,
        margin: EdgeInsets.only(top: 24),
        color: Color(0xffEEEEEE),
      );
    }

    Widget mostsearched() {
      return Container(
        margin: EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Most Searched",
              style: poppinsText.copyWith(
                  fontSize: 18, fontWeight: semiBold, color: black),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                MostSearchedItem(
                  text: "Flutter",
                ),
                MostSearchedItem(
                  text: "Laravel",
                ),
                MostSearchedItem(
                  text: "Figma UI",
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                MostSearchedItem(
                  text: "Public Speaking",
                ),
                MostSearchedItem(
                  text: "Fullstack Web Dev",
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget interesttitle() {
      return Container(
        margin: EdgeInsets.only(top: 24, left: 24),
        child: Text(
          "For Your Interest",
          style: poppinsText.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
      );
    }

    Widget interestcourse() {
      return BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          if (state is CourseSuccess) {
            return Container(
              margin: EdgeInsets.only(
                top: 12,
                left: 24,
                right: 24,
                bottom: 120
              ),
              child: Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 12,
                  childAspectRatio: 157 / 205,
                  children:state.courses
                          .map((course) => CourseGridItem(course: course))
                          .toList(),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    return ListView(
      shrinkWrap: true,
      children: [
        header(),
        line(),
        mostsearched(),
        interesttitle(),
        interestcourse(),
      ],
    );
  }
}
