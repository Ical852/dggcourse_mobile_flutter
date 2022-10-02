import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:dggcourses/widgets/interestitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterestPage extends StatefulWidget {
  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  var currentSelected = "Code";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 227,
                  child: Text(
                    "What are you Interested in",
                    style: poppinsText.copyWith(
                        fontSize: 32, fontWeight: semiBold, color: black),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 280,
                  child: Text(
                    "Choose what are you interested in, so we can recommend the best course for you",
                    style: poppinsText.copyWith(
                        fontSize: 16, fontWeight: light, color: grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      InterestItem(
                        text: "Code",
                        onPress: () {
                          this.setState(() {
                            currentSelected = "Code";
                          });
                        },
                        selected: currentSelected == "Code",
                      ),
                      InterestItem(
                        text: "UI Design",
                        onPress: () {
                          this.setState(() {
                            currentSelected = "UI Design";
                          });
                        },
                        selected: currentSelected == "UI Design",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 22,
                      ),
                      InterestItem(
                        text: "Soft Skill",
                        onPress: () {
                          this.setState(() {
                            currentSelected = "Soft Skill";
                          });
                        },
                        selected: currentSelected == "Soft Skill",
                      ),
                      InterestItem(
                        text: "Art",
                        onPress: () {
                          this.setState(() {
                            currentSelected = "Art";
                          });
                        },
                        selected: currentSelected == "Art",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 220,
                  child: BlocConsumer<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state is UserSuccess) {
                        Navigator.pushNamed(context, "/main-page");
                      }
                    },
                    builder: (context, state) {
                      return AuthButton(
                        text: "Find Course Now",
                        onPress: () {
                          if (state is UserSuccess) {
                            context.read<UserCubit>().updateInterest(userData: state.user, interests: currentSelected);
                          }
                        },
                      );
                    },
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
