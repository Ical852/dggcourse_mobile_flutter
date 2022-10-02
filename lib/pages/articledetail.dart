import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/models/article_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/commenttile.dart';
import 'package:dggcourses/widgets/headerarticledetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleDetail extends StatefulWidget {

  ArticleModel article;
  ArticleDetail(this.article);

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {

  TextEditingController commentController = TextEditingController(text: "");

  var hide = true;
  var fokus = false;
  List<Map<String, String>> usercomments = [];

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
                  controller: commentController,
                  autofocus: fokus,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(14),
                      hintStyle: poppinsText.copyWith(
                          fontSize: 14, fontWeight: reguler, color: grey),
                      hintText: "Send a Comment"),
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
                      for (var item in usercomments) {
                        array.add(item);
                      }
                      array.add({
                        "img": userimg,
                        "full_name" : name,
                        "text": commentController.text,
                      });

                      this.setState(() {
                        usercomments = array;
                      });

                      this.commentController = TextEditingController(text: "");
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

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 42, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 293,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(article_img + widget.article.img),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(8)
              ),
            ),
            SizedBox(height: 24,),
            Text(
              widget.article.title,
              style: poppinsText.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 12,),
            Text(
              "Become a mobile developer is quaite challenging, developing a mobile apps is harder than i think. I’m Prettie sure that if you try to be a mobile a developer, you will agree with my opinion. It’s not that hard actually, but it’s not that easy too. We still have to learn about it everyday, everytime. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: reguler,
                color: black
              ),
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/ic_author.png")
                          )
                        ),
                      ),
                      SizedBox(width: 4,),
                      Text(
                        widget.article.author,
                        style: poppinsText.copyWith(
                          fontSize: 10,
                          fontWeight: semiBold,
                          color: grey
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 17,
                        height: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/ic_date.png")
                          )
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.article.date,
                        style: poppinsText.copyWith(
                          fontSize: 10,
                          fontWeight: semiBold,
                          color: grey2
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    this.setState(() {
                      hide = !hide;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/ic_comment.png")
                            )
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.article.comments.length.toString() + " Comments",
                          style: poppinsText.copyWith(
                            fontSize: 10,
                            fontWeight: semiBold,
                            color: secondaryColor
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget commentSection() {
      return Container(
        margin: EdgeInsets.only(
          top: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 1, color: Color(0xffEEEEEE),),
            Container(
              margin: EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Comments",
                        style: poppinsText.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                          color: black
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          this.setState(() {
                            fokus = !fokus;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text(
                            "Comment +",
                            style: poppinsText.copyWith(
                              fontSize: 10,
                              fontWeight: medium,
                              color: white
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: widget.article.comments.map((comment) => CommentTile(name: comment.user.full_name, img: comment.user.img, desc: comment.text, replies: 1,)).toList(),
                  ),
                  Column(
                    children: usercomments.map((comment) => CommentTile(name: comment['full_name'].toString(), img: comment['img'].toString(), desc: comment['text'].toString(), replies: 1,)).toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            HeaderArticle(title: "Article Details"),
            content(),
            hide ? SizedBox() : commentSection(),
            fokus ? chatSender() : SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}