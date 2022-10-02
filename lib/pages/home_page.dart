import 'package:dggcourses/cubit/article_cubit.dart';
import 'package:dggcourses/cubit/categorycourse_cubit.dart';
import 'package:dggcourses/cubit/homearticle_cubit.dart';
import 'package:dggcourses/cubit/homecourse_cubit.dart';
import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/articletile.dart';
import 'package:dggcourses/widgets/categoryitem.dart';
import 'package:dggcourses/widgets/coursegrid.dart';
import 'package:dggcourses/widgets/popularitem.dart';
import 'package:dggcourses/widgets/promoitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomearticleCubit>().getHomeArticles();
    context.read<HomecourseCubit>().getHomeCourses();
    context.read<CategorycourseCubit>().getCategoryCourses(id: "1");
    context.read<HomecourseCubit>().getHomeCourses();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 125,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 26,
              width: 26,
              margin: EdgeInsets.only(top: 26, right: 24, left: 24),
              decoration: BoxDecoration(
                  color: blue1, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Container(
                  height: 14,
                  width: 16,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/ic_cat_white.png"))),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 26,
                  width: 26,
                  margin: EdgeInsets.only(
                    top: 26,
                    right: 8,
                  ),
                  decoration: BoxDecoration(
                      color: blue1, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/ic_home_search.png"))),
                    ),
                  ),
                ),
                Container(
                  height: 26,
                  width: 26,
                  margin: EdgeInsets.only(
                    top: 26,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                      color: blue1, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Container(
                      height: 19,
                      width: 16,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/ic_notif_white.png"))),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 29),
        width: double.infinity,
        child: Text(
          "Find Your Course",
          style: poppinsText.copyWith(
              fontSize: 14, fontWeight: semiBold, color: white),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget userBalance() {
      return Container(
        height: 80,
        margin: EdgeInsets.only(top: 78, right: 24, left: 24),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.2),
                  blurRadius: 2,
                  offset: Offset(0, 2))
            ],
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Dgg Money",
                  style: poppinsText.copyWith(
                      color: grey3, fontSize: 14, fontWeight: reguler),
                ),
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is UserSuccess) {
                      return Text(
                        "IDR. " + formatter(state.user.dggm),
                        style: poppinsText.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                            color: secondaryColor),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              ],
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  color: blue2, borderRadius: BorderRadius.circular(4)),
              padding: EdgeInsets.all(6),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/top-up");
                },
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/ic_plus.png"))),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget categoryContent() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 24,
              ),
              CategoryItem(
                title: "Code",
                total: "76 Course",
                image: "assets/ic_code.png",
                cat: 1,
              ),
              CategoryItem(
                title: "Design",
                total: "55 Course",
                image: "assets/ic_design.png",
                cat: 2,
              ),
              CategoryItem(
                title: "Soft Skill",
                total: "33 Course",
                image: "assets/ic_sskill.png",
                cat: 3,
              ),
              CategoryItem(
                title: "Art",
                total: "12 Course",
                image: "assets/ic_art.png",
                cat: 4,
              ),
              SizedBox(
                width: 12,
              )
            ],
          ),
        ),
      );
    }

    Widget popularCourse() {
      return BlocBuilder<CategorycourseCubit, CategorycourseState>(
        builder: (context, state) {
          if (state is CategorycourseSuccess) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Course",
                          style: poppinsText.copyWith(
                              fontSize: 14, fontWeight: semiBold, color: black),
                        ),
                        Text(
                          "Show all",
                          style: poppinsText.copyWith(
                              fontSize: 10,
                              color: primaryColor,
                              fontWeight: medium),
                        ),
                      ],
                    ),
                  ),
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
                        Row(
                          children: state.courses
                              .map((course) => PopularItem(course: course,))
                              .toList(),
                        ),
                        SizedBox(
                          width: 12,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    Widget articles() {
      return BlocBuilder<HomearticleCubit, HomearticleState>(
        builder: (context, state) {
          if (state is HomearticleSuccess) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Articles",
                          style: poppinsText.copyWith(
                              fontSize: 14, fontWeight: semiBold, color: black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/articles");
                          },
                          child: Text(
                            "Show all",
                            style: poppinsText.copyWith(
                                fontSize: 10,
                                color: primaryColor,
                                fontWeight: medium),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 12, right: 24, left: 24),
                      child: Column(
                          children: state.articles
                              .map((article) => ArticleTile(
                                  img: article.img,
                                  title: article.title,
                                  cat: article.article_category.name))
                              .toList()))
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    Widget promo() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Text(
                "Promo New User Top Up",
                style: poppinsText.copyWith(
                    fontSize: 14, fontWeight: semiBold, color: black),
              ),
            ),
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
            )
          ],
        ),
      );
    }

    Widget topPremiumCourse() {
      return BlocBuilder<HomecourseCubit, HomecourseState>(
        builder: (context, state) {
          if (state is HomecourseSuccess) {
            return Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Premium Course",
                          style: poppinsText.copyWith(
                              fontSize: 14, fontWeight: semiBold, color: black),
                        ),
                        Text(
                          "Show all",
                          style: poppinsText.copyWith(
                              fontSize: 10,
                              color: primaryColor,
                              fontWeight: medium),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12, left: 24, right: 24),
                    height: 760,
                    child: GridView.count(
                      crossAxisCount: 2,
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 157 / 205,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 12,
                      children: state.courses.map((course) => CourseGridItem(course: course,)
                      ).toList(),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Show All course >>",
                        style: poppinsText.copyWith(
                            fontSize: 12,
                            fontWeight: medium,
                            color: primaryColor),
                      ))
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 178),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              width: 194,
              child: Text(
                "Want to Study Class what's Today?",
                style: poppinsText.copyWith(
                    fontSize: 18, fontWeight: semiBold, color: black),
              ),
            ),
            categoryContent(),
            popularCourse(),
            articles(),
            promo(),
            topPremiumCourse(),
            SizedBox(
              height: 120,
            )
          ],
        ),
      );
    }

    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: [header(), title(), userBalance(), content()],
        ),
      ),
    );
  }
}
