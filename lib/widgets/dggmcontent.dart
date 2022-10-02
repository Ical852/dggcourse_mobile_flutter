import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class DggmContent extends StatelessWidget {

  String name;
  String phone;
  String dggm;
  String min;
  bool disabled;

  DggmContent({required this.name, required this.phone, required this.dggm, required this.min, this.disabled = false});

  @override
  Widget build(BuildContext context) {

    Widget disabledDggm() {
      return Container(
        height: 147,
        width: double.infinity,
        padding: EdgeInsets.all(16),
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
        child: Stack(
          children: [
            Opacity(
              opacity: 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/ic_logo_dggm.png")
                          )
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: poppinsText.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                              color: black
                            ),
                          ),
                          Text(
                            phone,
                            style: poppinsText.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                              color: black
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Text(
                    "Current Dgg Money",
                    style: poppinsText.copyWith(
                      fontSize: 12,
                      fontWeight: reguler,
                      color: grey3
                    ),
                  ),
                  SizedBox(height: 4,),
                  Row(
                    children: [
                      Text(
                        dggm,
                        style: poppinsText.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                          color: secondaryColor
                        ),
                      ),
                      Text(
                        min,
                        style: poppinsText.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                          color: red
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Text(
                "Not Enough DggM !",
                style: poppinsText.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                  color: red
                ),
              ),
            )
          ]
        ),
      );
    }

    return disabled ? disabledDggm() : Container(
      height: 147,
      width: double.infinity,
      padding: EdgeInsets.all(16),
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
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/ic_logo_dggm.png")
                  )
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: poppinsText.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                      color: black
                    ),
                  ),
                  Text(
                    phone,
                    style: poppinsText.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                      color: black
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 16,),
          Text(
            "Current Dgg Money",
            style: poppinsText.copyWith(
              fontSize: 12,
              fontWeight: reguler,
              color: grey3
            ),
          ),
          SizedBox(height: 4,),
          Row(
            children: [
              Text(
                dggm,
                style: poppinsText.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                  color: secondaryColor
                ),
              ),
              Text(
                min,
                style: poppinsText.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                  color: red
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}