import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class MidtransPay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      width: double.infinity,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 2))
        ]
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 24
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Method",
            style: poppinsText.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: black
            ),
          ),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: white,
              border: Border.all(
                color: grey.withOpacity(0.5)
              ),
              borderRadius: BorderRadius.circular(8)
            ),
            margin: EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 16,),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/ic_midtrans.png")
                        )
                      ),
                    ),
                    SizedBox(width: 12,),
                    Text(
                      "Midtrans Payment",
                      style: poppinsText.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                        color: black
                      ),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ic_down.png")
                    )
                  ),
                ),
                SizedBox(width: 16,)
              ],
            ),
          )
        ],
      ),
    );
  }
}