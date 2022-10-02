import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:dggcourses/widgets/custominput.dart';
import 'package:dggcourses/widgets/profileheader.dart';
import 'package:flutter/material.dart';

class UpdateProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: "");
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController phoneController = TextEditingController(text: "");

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Update Profile",
              style: poppinsText.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
                color: black
              ),
            ),
            Text(
              "Update your profile here",
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: light,
                color: grey
              ),
            ),
            SizedBox(height: 36,),
            Container(
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
                  CustomInput(title: "Full Name", controller: nameController,),
                  CustomInput(title: "Email Address", controller: emailController,),
                  CustomInput(title: "Phone Number", controller: phoneController,),
                  SizedBox(
                    height: 10,
                  ),
                  AuthButton(text: "Save", onPress: () {})
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
                        "Change Password",
                        style: poppinsText.copyWith(
                            fontSize: 16,
                            color: grey,
                            fontWeight: light,
                            decoration: TextDecoration.underline),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/changepw");
                        },
                        child: Text(
                          " Here!",
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
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            ProfileHeader(title: "Edit Profile",),
            content()
          ],
        ),
      ),
    );
  }
}