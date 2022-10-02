import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class MentorChat extends StatelessWidget {

  String text;
  String img;

  MentorChat({required this.text, required this.img});

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 12),
              width: 30,
              height: 33,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(mentor_img + img),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 15
              ),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)
                )
              ),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                text,
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: reguler,
                  color: white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}