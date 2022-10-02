import 'dart:async';
import 'dart:math';

import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/models/course_model.dart';
import 'package:dggcourses/models/transaction_model.dart';
import 'package:dggcourses/models/user_course_model.dart';
import 'package:dggcourses/pages/buyclasssuccess.dart';
import 'package:dggcourses/services/transaction_service.dart';
import 'package:dggcourses/services/usercourse_service.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/custombutton.dart';
import 'package:dggcourses/widgets/dggmcontent.dart';
import 'package:dggcourses/widgets/headeroback.dart';
import 'package:dggcourses/widgets/midtranspay.dart';
import 'package:dggcourses/widgets/paymentsummary.dart';
import 'package:dggcourses/widgets/toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentSummary extends StatefulWidget {
  CourseModel course;
  PaymentSummary(this.course);

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var toggle = "left";
  var loading = false;
  var payment_url = "";

  @override
  Widget build(BuildContext context) {

    void dggmPayment() async {
      
      var order_id = Random().nextInt(10000).toString() + Random().nextInt(1000).toString();
      var totalAmount = widget.course.price;
      var state = BlocProvider.of<UserCubit>(context).state;
      var user_id = "";
      if (state is UserSuccess) {
        user_id = state.user.id;
      }

      TransactionModel transaction = await TransactionService().dggmTransaction(
        course_id: widget.course.id,
        order_id: order_id,
        total: totalAmount,
        user_id: user_id
      );

      UserCourseModel usercourse = await UserCourseService().buyCourse(
        course_id: widget.course.id,
        user_id: user_id
      );

      this.setState(() {
        loading = true;
      });

      Timer(Duration(seconds: 1), () {
        this.setState(() {
          loading = false;
        });
      });

      Timer(Duration(seconds: 2), () {
        Navigator.push(
          context,MaterialPageRoute(
            builder: (context) => BuyClassSuccess()
          )
        );
      });
    }

    void finishPayment() {
      this.setState(() {
        payment_url = "";
      });
      Timer(Duration(seconds: 1), () {
        Navigator.push(
          context,MaterialPageRoute(
            builder: (context) => BuyClassSuccess()
          )
        );
      });
    }

    void midtransPayment() async {
      var order_id = Random().nextInt(10000).toString() + Random().nextInt(1000).toString();
      var totalAmount = widget.course.price;
      var state = BlocProvider.of<UserCubit>(context).state;
      var user_id = "";
      if (state is UserSuccess) {
        user_id = state.user.id;
      }

      TransactionModel transaction = await TransactionService().midtransTransaction(
        course_id: widget.course.id,
        order_id: order_id,
        total: totalAmount,
        user_id: user_id
      );

      UserCourseModel usercourse = await UserCourseService().buyCourse(
        course_id: widget.course.id,
        user_id: user_id
      );

      this.setState(() {
        payment_url = transaction.payment_url;
      });

    }

    Widget stars() {
      return Container(
        child: Row(
          children: [
            Container(
              width: 14,
              height: 14,
              margin: EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/ic_star.png"))),
            ),
            Container(
              width: 14,
              height: 14,
              margin: EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/ic_star.png"))),
            ),
            Container(
              width: 14,
              height: 14,
              margin: EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/ic_star.png"))),
            ),
            Container(
              width: 14,
              height: 14,
              margin: EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/ic_star.png"))),
            ),
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/ic_star.png"))),
            )
          ],
        ),
      );
    }

    Widget rating() {
      return Container(
        child: Row(
          children: [
            stars(),
            SizedBox(
              width: 4,
            ),
            Text(
              "(4016)",
              style: poppinsText.copyWith(
                  fontSize: 10, fontWeight: medium, color: grey2),
            )
          ],
        ),
      );
    }

    Widget courseContent() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            height: 227,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(course_img + widget.course.img),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(14)),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, left: 24, right: 24),
            width: 250,
            child: Text(
              widget.course.title,
              style: poppinsText.copyWith(
                  fontSize: 18, fontWeight: semiBold, color: black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, left: 24, right: 24),
            child: Row(
              children: [
                Text(
                  "IDR " + formatter(widget.course.price),
                  style: poppinsText.copyWith(
                      fontSize: 18, fontWeight: semiBold, color: green),
                ),
                Spacer(),
                rating()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24),
            height: 1,
            color: Color(0xffEEEEEE),
          )
        ],
      );
    }

    Widget dggm() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(24),
                    child: DggmContent(
                      name: "Shalahuddin Ahmad Aziz",
                      phone: "089674839221",
                      dggm: "IDR " + formatter(state.user.dggm),
                      min: " - " + formatter(widget.course.price),
                      disabled: widget.course.price > state.user.dggm,
                    ),
                  ),
                  PaymentSummaryItem(
                    name: state.user.full_name,
                    email: state.user.email,
                    phone: state.user.phone_number,
                    total: "IDR " + formatter(widget.course.price),
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

    Widget manual() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  PaymentSummaryItem(
                    name: state.user.full_name,
                    email: state.user.email,
                    phone: state.user.phone_number,
                    total: "IDR " + formatter(widget.course.price),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  MidtransPay()
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

    Widget renderPayment() {
      return toggle == "left" ? dggm() : manual();
    }

    Widget paymentContent() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Toggle(
                  currentToggle: toggle,
                  left: "Dgg Money",
                  right: "Manual Payment",
                  leftPress: () {
                    this.setState(() {
                      toggle = "left";
                    });
                  },
                  rightPress: () {
                    this.setState(() {
                      toggle = "right";
                    });
                  }),
            ),
            renderPayment(),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                      child: CustomButton(
                        text: "Checkout Now",
                        onPress: () {
                          if (toggle == "left") {
                            this.setState(() {
                              loading = true;
                            });
                            dggmPayment();
                          }
                          if (toggle == "right") {
                            this.setState(() {
                              loading = true;
                            });
                            midtransPayment();
                          }
                        },
                        disable: toggle == "left" &&
                            widget.course.price > state.user.dggm,
                      ));
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      );
    }

    return payment_url != "" ? 
    Scaffold(
      appBar: AppBar(
        title: Text("Top Up Payment"),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: (){
            finishPayment();
          },
        ),
      ),
      body: WebView(
        initialUrl: payment_url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    )
    : Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: loading ? Center(child: CircularProgressIndicator()) : ListView(
          children: [
            HeaderBackOnly(title: "Payment Summary"),
            courseContent(),
            paymentContent()
          ],
        ),
      ),
    );
  }
}
