import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/models/user_model.dart';
import 'package:dggcourses/pages/wannabe.dart';
import 'package:dggcourses/services/user_service.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusPage extends StatefulWidget {
  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 38),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  padding: EdgeInsets.all(24),
                  height: 200,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(34)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: poppinsText.copyWith(
                                  fontSize: 14,
                                  fontWeight: light,
                                  color: white),
                            ),
                            BlocBuilder<UserCubit, UserState>(
                              builder: (context, state) {
                                if (state is UserSuccess) {
                                  return Text(
                                    state.user.full_name,
                                    style: poppinsText.copyWith(
                                        fontSize: 20,
                                        fontWeight: medium,
                                        color: white),
                                  );
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Balance",
                            style: poppinsText.copyWith(
                                fontSize: 14, fontWeight: light, color: white),
                          ),
                          Text(
                            "IDR 100.000",
                            style: poppinsText.copyWith(
                                fontSize: 20, fontWeight: medium, color: white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "New User Bonus!",
                  style: poppinsText.copyWith(
                      fontSize: 32, fontWeight: semiBold, color: black),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 264,
                  child: Text(
                    "We give you early dgg money so that you can buy any course",
                    textAlign: TextAlign.center,
                    style: poppinsText.copyWith(
                        fontSize: 16, color: grey, fontWeight: light),
                  ),
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
                        onPress: () async {
                          if (state is UserSuccess) {
                            context
                                .read<UserCubit>()
                                .updateDggm(userData: state.user, dggm: 100000);
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WannabePage()));
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
