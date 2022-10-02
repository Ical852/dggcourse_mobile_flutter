import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:dggcourses/widgets/custominput.dart';
import 'package:dggcourses/widgets/profileheader.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController cpController = TextEditingController(text: "");
    TextEditingController npController = TextEditingController(text: "");
    TextEditingController cnpController = TextEditingController(text: "");

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Update Password",
              style: poppinsText.copyWith(
                  fontSize: 22, fontWeight: semiBold, color: black),
            ),
            Text(
              "Update your password here",
              style: poppinsText.copyWith(
                  fontSize: 14, fontWeight: light, color: grey),
            ),
            SizedBox(
              height: 36,
            ),
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
                  CustomInput(
                    title: "Current Password",
                    controller: cpController,
                  ),
                  CustomInput(
                    title: "New Password",
                    controller: npController,
                  ),
                  CustomInput(
                    title: "Confirm New Password",
                    controller: cnpController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthButton(text: "Change", onPress: () {})
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [ProfileHeader(title: "Change Password",), content()],
        ),
      ),
    );
  }
}