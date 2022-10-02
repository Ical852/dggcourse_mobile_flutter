import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/pages/bonus.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:dggcourses/widgets/custombutton.dart';
import 'package:dggcourses/widgets/custominput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: "");
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController(text: "");
    TextEditingController phoneController = TextEditingController(text: "");


    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, right: 30, left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: poppinsText.copyWith(
                        fontSize: 22, fontWeight: semiBold, color: black),
                  ),
                  Text(
                    "Sign up and find your best course",
                    style: poppinsText.copyWith(
                        fontSize: 14, fontWeight: light, color: grey),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48, right: 24, left: 24),
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
                    title: "Full Name",
                    controller: nameController,
                  ),
                  CustomInput(
                    title: "Email Address",
                    controller: emailController,
                  ),
                  CustomInput(
                    title: "Password",
                    controller: passwordController,
                    secure: true,
                  ),
                  CustomInput(
                    title: "Phone Number",
                    controller: phoneController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<UserCubit, UserState>(
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

                      return Container(
                        child: AuthButton(
                          onPress: () {
                            context.read<UserCubit>().register(
                              email: emailController.text, 
                              full_name: nameController.text, 
                              password: passwordController.text ,
                              phone_number: phoneController.text
                            );
                            if (state is UserSuccess) {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BonusPage()));
                            }
                          },
                          text: "Sign Up",
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have an Account?",
                    style: poppinsText.copyWith(
                        color: grey,
                        fontSize: 16,
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
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: semiBold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
