import 'package:dggcourses/models/article_model.dart';
import 'package:dggcourses/pages/articledetail.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class ArticleMiniTile extends StatelessWidget {

  ArticleModel article;
  ArticleMiniTile({required this.article});

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
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        height: 90,
        padding: EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 15
        ),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(article_img + article.img),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(8)
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  article.title,
                  style: poppinsText.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                    color: black
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 6,),
                Container(
                  width: 270,
                  child: Text(
                    article.description,
                    style: poppinsText.copyWith(
                      fontSize: 12,
                      fontWeight: reguler,
                      color: grey
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}