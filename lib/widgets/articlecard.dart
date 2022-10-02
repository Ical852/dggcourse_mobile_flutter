import 'package:dggcourses/models/article_model.dart';
import 'package:dggcourses/pages/articledetail.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {

  ArticleModel article;
  ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => ArticleDetail(article)
          )
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 14),
            width: 200,
            height: 275,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article_img + article.img),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          Container(
            width: 200,
            height: 275,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.white.withOpacity(0),
                  Color(0xff191410).withOpacity(0.15),
                  Color(0xff191410).withOpacity(0.25),
                  Color(0xff191410).withOpacity(0.35),
                  Color(0xff191410).withOpacity(0.45),
                  Color(0xff191410).withOpacity(0.95),
                ]),
                borderRadius: BorderRadius.circular(10)
              ),
          ),
          Container(
            width: 200,
            height: 275,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(
                  left: 17,
                  bottom: 17,
                  right: 17
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      article.title,
                      style: 
                      poppinsText.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: white
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      article.description,
                      style: 
                      poppinsText.copyWith(
                        fontSize: 10,
                        fontWeight: reguler,
                        color: white,
                      ),
                      maxLines: 1,
                    )
                  ],
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}