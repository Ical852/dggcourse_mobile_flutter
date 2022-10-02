import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class CommentTile extends StatefulWidget {

  String name;
  String img;
  String desc;
  int replies;

  CommentTile({required this.name, required this.img, required this.desc, this.replies = 0});

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {

  var hideReply = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.2),
                blurRadius: 2,
                offset: Offset(0, 2))
            ],
            borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(user_img + widget.img),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
              SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: poppinsText.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: black
                    ),
                  ),
                  SizedBox(height: 6,),
                  Container(
                    width: MediaQuery.of(context).size.width - 48 - 24 - 36 - 12,
                    child: Text(
                      widget.desc,
                      style: poppinsText.copyWith(
                        fontSize: 12,
                        fontWeight: reguler,
                        color: grey
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/ic_love_active.png")
                                  )
                                ),
                              ),
                              SizedBox(width: 4,),
                              Text(
                                "120",
                                style: poppinsText.copyWith(
                                  fontSize: 11,
                                  fontWeight: semiBold,
                                  color: red
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            this.setState(() {
                              hideReply = !hideReply;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 12
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/ic_comment.png")
                                    )
                                  ),
                                ),
                                SizedBox(width: 4,),
                                Text(
                                  "${widget.replies} Replies",
                                  style: poppinsText.copyWith(
                                    fontSize: 11,
                                    fontWeight: semiBold,
                                    color: secondaryColor
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/ic_reply.png")
                                  )
                                ),
                              ),
                              SizedBox(width: 4,),
                              Text(
                                "reply +",
                                style: poppinsText.copyWith(
                                  fontSize: 11,
                                  fontWeight: semiBold,
                                  color: green
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 100,),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/ic_trash.png")
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        widget.replies > 0 && !hideReply ? Container(
          margin: EdgeInsets.only(left: 55, top: 8, bottom: 20),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.2),
                blurRadius: 2,
                offset: Offset(0, 2))
            ],
            borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/ic_comment1.png"),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
              SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Jordan",
                    style: poppinsText.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: black
                    ),
                  ),
                  SizedBox(height: 6,),
                  Container(
                    width: MediaQuery.of(context).size.width - 48 - 24 - 36 - 12 - 55,
                    child: Text(
                      "Agree with this comments!!. 100 for the authors.",
                      style: poppinsText.copyWith(
                        fontSize: 12,
                        fontWeight: reguler,
                        color: grey
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/ic_love_active.png")
                                  )
                                ),
                              ),
                              SizedBox(width: 4,),
                              Text(
                                "120",
                                style: poppinsText.copyWith(
                                  fontSize: 11,
                                  fontWeight: semiBold,
                                  color: red
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 12,),
                        Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/ic_trash.png")
                                ),
                              ),
                            ),
                            Text(
                              "delete",
                              style: poppinsText.copyWith(
                                fontSize: 11,
                                fontWeight: reguler,
                                color: yellow
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ) : SizedBox(height: 20,),
      ],
    );
  }
}