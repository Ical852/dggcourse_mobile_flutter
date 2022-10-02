import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:dggcourses/widgets/wannabeitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WannabePage extends StatefulWidget {
  @override
  State<WannabePage> createState() => _WannabePageState();
}

class _WannabePageState extends State<WannabePage> {
  var currentSelected = "Developer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 207,
                  child: Text(
                    "What do you want to be",
                    textAlign: TextAlign.center,
                    style: poppinsText.copyWith(
                        fontSize: 32, fontWeight: semiBold, color: black),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "What do you want to be in the future, what do you expect after finish some course from this app",
                    style: poppinsText.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                      color: grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                WannaBeItem(
                  title: "Developer",
                  selected: currentSelected == "Developer",
                  onPress: () {
                    this.setState(() {
                      currentSelected = "Developer";
                    });
                  },
                ),
                WannaBeItem(
                  title: "UI / UX Designer",
                  selected: currentSelected == "UI / UX Designer",
                  onPress: () {
                    this.setState(() {
                      currentSelected = "UI / UX Designer";
                    });
                  },
                ),
                WannaBeItem(
                  title: "Frontliner",
                  selected: currentSelected == "Frontliner",
                  onPress: () {
                    this.setState(() {
                      currentSelected = "Frontliner";
                    });
                  },
                ),
                WannaBeItem(
                  title: "Artist",
                  selected: currentSelected == "Artist",
                  onPress: () {
                    this.setState(() {
                      currentSelected = "Artist";
                    });
                  },
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.only(top: 50),
                  child: BlocConsumer<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state is UserSuccess) {
                      }
                    },
                    builder: (context, state) {
                      if (state is UserLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return AuthButton(
                        text: "Next",
                        onPress: () {
                          if (state is UserSuccess) {
                            context.read<UserCubit>().updateRole(userData: state.user, role: currentSelected);
                            Navigator.pushNamed(context, "/interest");
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
