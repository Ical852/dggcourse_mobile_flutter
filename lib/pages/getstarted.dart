import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/firstbg.png"),
                fit: BoxFit.cover
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 32
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 253,
                    child: Text(
                      "Find the best course that you need",
                      style: poppinsText.copyWith(
                        fontSize: 24,
                        fontWeight: medium,
                        color: black
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    "One of the courses App where you will find the right course learning of interest, and you just have to pay the courses payment, and you got the class.",
                    style: poppinsText.copyWith(
                      fontSize: 16,
                      fontWeight: reguler,
                      color: grey
                    ),
                  ),
                  SizedBox(
                    height: 63,
                  ),
                  CustomButton(
                    text: "Get Started",
                    onPress: (){
                      Navigator.pushNamed(context, "/sign-up");
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}