import 'package:dggcourses/cubit/article_cubit.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/article_mini_tile.dart';
import 'package:dggcourses/widgets/articlecard.dart';
import 'package:dggcourses/widgets/headeroback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesPage extends StatefulWidget {
  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ArticleCubit>().getAllArticles();
  }

  @override
  Widget build(BuildContext context) {
    Widget mainArticle() {
      return BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          if (state is ArticleSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 32),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Row(
                      children: state.articles
                          .map((article) => ArticleCard(
                                article: article,
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
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

    Widget search() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                height: 48,
                decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: black.withOpacity(0.2),
                          blurRadius: 2,
                          offset: Offset(0, 2))
                    ],
                    borderRadius: BorderRadius.circular(14)),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/ic_article_search.png"))),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Search articles you like",
                      style: poppinsText.copyWith(
                          fontSize: 14, fontWeight: reguler, color: grey),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(14)),
              child: Center(
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/ic_filter.png"))),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget titlensearch() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Ical!",
              style: poppinsText.copyWith(
                  fontSize: 16, fontWeight: reguler, color: black),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Find Articles You Like",
              style: poppinsText.copyWith(
                  fontSize: 24, fontWeight: semiBold, color: black),
            ),
            search()
          ],
        ),
      );
    }

    Widget popularArticle() {
      return BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          if (state is ArticleSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 32, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Popular Articles",
                    style: poppinsText.copyWith(
                        fontSize: 16, fontWeight: bold, color: black),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: state.articles.map((article) => ArticleMiniTile(article: article,)).toList(),
                  ),
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

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          HeaderBackOnly(title: "All Articles"),
          titlensearch(),
          mainArticle(),
          popularArticle(),
          SizedBox(
            height: 100,
          )
        ],
      )),
    );
  }
}
