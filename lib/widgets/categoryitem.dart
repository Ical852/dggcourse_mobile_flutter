import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  String title;
  String total;
  String image;
  int cat;

  CategoryItem({required this.title, required this.total, required this.image, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      margin: EdgeInsets.only(
        bottom: 24,
        right: 12
      ),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: blue3,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Center(
              child: Container(
                width: cat == 1 ? 21 : cat == 2 ? 22 : cat == 3? 21 : 23,
                height: cat == 1 ? 12 : cat == 2 ? 23 : cat == 3 ? 22: 22,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image)
                  )
                ),
              ),
            ),
          ),
          SizedBox(height: 17,),
          Text(
            title,
            style: poppinsText.copyWith(
              color: black,
              fontSize: 12,
              fontWeight: semiBold
            ),
          ),
          SizedBox(height: 4,),
          Text(
            total,
            style: poppinsText.copyWith(
              fontSize: 10,
              fontWeight: medium,
              color: grey2
            ),
          ),
        ],
      ),
    );
  }
}