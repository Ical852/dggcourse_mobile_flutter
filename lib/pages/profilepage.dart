import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/profileitem.dart';
import 'package:dggcourses/widgets/stackheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget currentDggm() {
      return Container(
        padding: EdgeInsets.only(top: 16, left: 16, bottom: 16, right: 29),
        margin: EdgeInsets.only(top: 14, left: 24, right: 24),
        height: 82,
        decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.2),
                  blurRadius: 2,
                  offset: Offset(0, 2))
            ],
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/ic_logo_dggm.png"))),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Dgg Money",
                  style: poppinsText.copyWith(
                      fontSize: 12, fontWeight: reguler, color: grey3),
                ),
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is UserSuccess) {
                      return Text(
                        "IDR. " + formatter(state.user.dggm),
                        style: poppinsText.copyWith(
                            fontSize: 20,
                            fontWeight: semiBold,
                            color: secondaryColor),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  color: blue2, borderRadius: BorderRadius.circular(4)),
              padding: EdgeInsets.all(6),
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ic_plus.png"))),
              ),
            )
          ],
        ),
      );
    }

    Widget profileData() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Text(
                    state.user.full_name,
                    style: poppinsText.copyWith(
                        fontSize: 18, fontWeight: semiBold, color: black),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    state.user.role,
                    style: poppinsText.copyWith(
                        fontSize: 14, fontWeight: medium, color: black),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Interest : " + state.user.interests,
                    style: poppinsText.copyWith(
                        fontSize: 14, fontWeight: reguler, color: black),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    Widget profilesettings() {
      return Container(
        margin: EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile Settings",
              style: poppinsText.copyWith(
                  fontSize: 16, fontWeight: semiBold, color: black),
            ),
            SizedBox(
              height: 14,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/update-profile");
              },
              child: ProfileSettingsItem(
                ptype: 1,
                title: "Edit Profile",
                subtitle: "Edit Your Profile",
                img: "assets/ic_edit.png",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/my-courses");
              },
              child: ProfileSettingsItem(
                ptype: 2,
                title: "My Courses",
                subtitle: "Start to learn from course",
                img: "assets/ic_my_course.png",
              ),
            ),
            ProfileSettingsItem(
              ptype: 3,
              title: "My Transactions",
              subtitle: "Your Transactions History",
              img: "assets/ic_transaction.png",
            ),
            ProfileSettingsItem(
              ptype: 4,
              title: "Help Center",
              subtitle: "Need more help",
              img: "assets/ic_help.png",
            ),
            ProfileSettingsItem(
              ptype: 5,
              title: "Settings",
              subtitle: "Settings your account",
              img: "assets/ic_settings.png",
            ),
          ],
        ),
      );
    }

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          return ListView(
            children: [
              StackHeader(title: "My Profile"),
              Container(
                margin: EdgeInsets.only(top: 32),
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/dummyava.png"))),
              ),
              profileData(),
              currentDggm(),
              profilesettings(),
              SizedBox(
                height: 150,
              )
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}
