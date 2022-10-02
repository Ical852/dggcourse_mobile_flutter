import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:dggcourses/widgets/custominput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "");

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/mainbg.png"),
              fit: BoxFit.cover
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Reset",
                        style: poppinsText.copyWith(
                            fontSize: 22, fontWeight: semiBold, color: black),
                      ),
                      Text(
                        "Send Your Email Address",
                        style: poppinsText.copyWith(
                            fontSize: 14, color: grey, fontWeight: light),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: black.withOpacity(0.2),
                          blurRadius: 2,
                          offset: Offset(0, 2))
                    ],
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      CustomInput(title: "Email Address", controller: emailController,),
                      SizedBox(
                        height: 10,
                      ),
                      AuthButton(text: "Send Reset Link", onPress: () {})
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Have an Account?",
                            style: poppinsText.copyWith(
                                fontSize: 16,
                                color: grey,
                                fontWeight: light,
                                decoration: TextDecoration.underline),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/sign-in");
                            },
                            child: Text(
                              " Sign In!",
                              style: poppinsText.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                  color: primaryColor,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}