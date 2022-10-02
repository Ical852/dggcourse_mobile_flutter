import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:dggcourses/widgets/custominput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController(text: "");

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/mainbg.png"), fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Sign In",
                        style: poppinsText.copyWith(
                            fontSize: 22, fontWeight: semiBold, color: black),
                      ),
                      Text(
                        "Find your best course",
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
                      CustomInput(
                        title: "Email Address",
                        controller: emailController,
                      ),
                      CustomInput(
                        title: "Password",
                        controller: passwordController,
                        secure: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      BlocConsumer<UserCubit, UserState>(
                        listener: (context, state) {
                          if (state is UserSuccess) {
                            Navigator.pushNamed(context, "/main-page");
                          }
                        },
                        builder: (context, state) {
                          if (state is UserLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return AuthButton(text: "Sign In", onPress: () {
                            context.read<UserCubit>().login(
                              email: emailController.text, 
                              password: passwordController.text
                            );
                          });
                        },
                      )
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
                            "Dont Have an Account yet?",
                            style: poppinsText.copyWith(
                                fontSize: 16,
                                color: grey,
                                fontWeight: light,
                                decoration: TextDecoration.underline),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/sign-up");
                            },
                            child: Text(
                              " Sign Up!",
                              style: poppinsText.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                  color: primaryColor,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot Your Password?",
                            style: poppinsText.copyWith(
                                fontSize: 16,
                                color: grey,
                                fontWeight: light,
                                decoration: TextDecoration.underline),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/reset");
                            },
                            child: Text(
                              " Reset!",
                              style: poppinsText.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                  color: primaryColor,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      )
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
