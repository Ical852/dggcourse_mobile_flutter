import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/pages/topupsummary.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/custombutton.dart';
import 'package:dggcourses/widgets/dggmcontent.dart';
import 'package:dggcourses/widgets/toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpPage extends StatefulWidget {
  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  var currentToggle = "left";
  var currentChoose = "";

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
          height: 125,
          width: double.infinity,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12))),
          child: Container(
            margin: EdgeInsets.only(top: 25, left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                      color: blue1,
                      boxShadow: [
                        BoxShadow(
                            color: black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: Offset(0, 2))
                      ],
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 8,
                        height: 12,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/ic_back_white.png"))),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Dgg Money Top Up",
                  style: poppinsText.copyWith(
                      fontSize: 14, fontWeight: semiBold, color: white),
                ),
                Container(
                  width: 26,
                  height: 26,
                )
              ],
            ),
          ));
    }

    Widget userDggm() {
      return Container(
        margin: EdgeInsets.only(top: 78, left: 24, right: 24),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return DggmContent(
                dggm: "IDR " + formatter(state.user.dggm),
                name: state.user.full_name,
                phone: state.user.phone_number,
                min: "",
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
    }

    Widget toggler() {
      return Container(
        margin: EdgeInsets.only(top: 250, left: 24, right: 24),
        child: Toggle(
          left: "Top Up",
          right: "Qr Code",
          leftPress: () {
            this.setState(() {
              currentToggle = "left";
            });
          },
          rightPress: () {
            this.setState(() {
              currentToggle = "right";
            });
          },
          currentToggle: currentToggle,
        ),
      );
    }

    Widget topUpItem(amount) {
      return GestureDetector(
        onTap: () {
          this.setState(() {
            currentChoose = amount;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: currentChoose == amount ? secondaryColor : white,
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.2),
                  blurRadius: 2,
                  offset: Offset(0, 2))
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              formatter(int.parse(amount)),
              style: poppinsText.copyWith(
                  fontSize: 20,
                  fontWeight: reguler,
                  color: currentChoose == amount ? white : black),
            ),
          ),
        ),
      );
    }

    Widget topUpContent() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        margin: EdgeInsets.only(top: 337),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fast Top Up :",
              style: poppinsText.copyWith(
                  fontSize: 14, fontWeight: semiBold, color: secondaryColor),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              height: 250,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 160 / 58,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
                children: [
                  topUpItem("50000"),
                  topUpItem("100000"),
                  topUpItem("200000"),
                  topUpItem("300000"),
                  topUpItem("500000"),
                  topUpItem("1000000"),
                ],
              ),
            ),
            Text(
              "Manual Amount",
              style: poppinsText.copyWith(
                  fontSize: 14, fontWeight: semiBold, color: secondaryColor),
            ),
            Row(
              children: [
                Text(
                  "IDR. ",
                  style: poppinsText.copyWith(
                      fontSize: 24, fontWeight: semiBold, color: black),
                ),
                Expanded(
                  child: TextFormField(
                    style: poppinsText.copyWith(
                        fontSize: 24, fontWeight: semiBold, color: black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: poppinsText.copyWith(
                          fontSize: 24, fontWeight: semiBold, color: black),
                      hintText: "0",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget qrCode() {
      return Container(
        margin: EdgeInsets.only(top: 345),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 255,
                width: 255,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/qr.png"))),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Scan Qr Code for the payment",
                style: poppinsText.copyWith(
                    fontSize: 14, fontWeight: medium, color: black),
              )
            ],
          ),
        ),
      );
    }

    Widget renderContent() {
      return currentToggle == "left" ? topUpContent() : qrCode();
    }

    Widget bottomCheckout() {
      return Container(
        margin: EdgeInsets.only(top: 685),
        child: Column(
          children: [
            SizedBox(
              height: 41,
            ),
            Container(
                height: 1, width: double.infinity, color: Color(0xffEEEEEE)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: CustomButton(
                  disable: currentChoose == "",
                  text: "Continue",
                  onPress: () {
                    if (currentChoose == "") {
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TopUpSummary(currentChoose)));
                    }
                  }),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              header(),
              userDggm(),
              toggler(),
              Container(
                height: 1,
                width: double.infinity,
                color: Color(0xffEEEEEE),
                margin: EdgeInsets.only(top: 321),
              ),
              renderContent(),
              bottomCheckout()
            ],
          ),
        ),
      ),
    );
  }
}
