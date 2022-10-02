import 'dart:async';

import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyClassSuccess extends StatefulWidget {

  @override
  State<BuyClassSuccess> createState() => _BuyClassSuccessState();
}

class _BuyClassSuccessState extends State<BuyClassSuccess> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var state = BlocProvider.of<UserCubit>(context).state;
    if (state is UserSuccess) {
      Timer(Duration(seconds: 3), () {
        context.read<UserCubit>().fetch(user_id: state.user.id);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/paymentsuccess.png")
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Payment Success!",
                  style: poppinsText.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                    color: black
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  width: 230,
                  child: Text(
                    "Now you have the access for the course that you just paid",
                    style: poppinsText.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                      color: grey
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 200,
                  child: AuthButton(
                    text: "Home",
                    onPress: (){
                      Navigator.pushNamed(context, "/main-page");
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