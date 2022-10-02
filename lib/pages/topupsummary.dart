import 'dart:async';
import 'dart:math';

import 'package:dggcourses/cubit/topup_cubit.dart';
import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/models/topup_model.dart';
import 'package:dggcourses/pages/topupsuccess.dart';
import 'package:dggcourses/services/topup_service.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/custombutton.dart';
import 'package:dggcourses/widgets/dggmcontent.dart';
import 'package:dggcourses/widgets/headeroback.dart';
import 'package:dggcourses/widgets/midtranspay.dart';
import 'package:dggcourses/widgets/paymentsummary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TopUpSummary extends StatefulWidget {
  String total;
  TopUpSummary(this.total);

  @override
  State<TopUpSummary> createState() => _TopUpSummaryState();
}

class _TopUpSummaryState extends State<TopUpSummary> {

  var payment_url = "";
  var loading = false;

  @override
  Widget build(BuildContext context) {

    void topUpMidtrans() async {
      var order_id = Random().nextInt(10000).toString() + Random().nextInt(1000).toString();
      var totalAmount = int.parse(widget.total);
      var state = BlocProvider.of<UserCubit>(context).state;
      var user_id = "";
      if (state is UserSuccess) {
        user_id = state.user.id;
      }

      print(order_id);
      print(totalAmount);
      print(user_id);
      
      TopUpModel topUp = await TopUpService().topUp(
        order_id: order_id,
        total: totalAmount,
        user_id: user_id
      );

      this.setState(() {
        loading = false;
      });

      this.setState(() {
        payment_url = topUp.payment_url;
      });
    }

    void finishPayment() {
      this.setState(() {
        payment_url = "";
      });
      Timer(Duration(seconds: 1), () {
        Navigator.push(
          context,MaterialPageRoute(
            builder: (context) => TopUpSuccess()
          )
        );
      });
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
        child: loading ? Center(child: CircularProgressIndicator()) : BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return ListView(
                children: [
                  HeaderBackOnly(title: "Top Up Summary"),
                  Container(
                    margin: EdgeInsets.only(top: 27, left: 24, right: 24),
                    child: DggmContent(
                      dggm: "IDR " + formatter(state.user.dggm) + " + " + formatter(int.parse(widget.total)),
                      min: "",
                      name: "Shalahuddin Ahmad Aziz",
                      phone: "089674839221",
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  PaymentSummaryItem(
                      name: "Shalahuddin Ahmad Aziz",
                      email: "shalahuddin@gmail.com",
                      phone: "089674839221",
                      total: "IDR " + formatter(int.parse(widget.total))
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  MidtransPay(),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xffEEEEEE)),
                  loading ? CircularProgressIndicator() : Container(
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    child: CustomButton(
                        text: "Top Up Now",
                        onPress: () {
                          this.setState(() {
                            loading = true;
                          });
                          topUpMidtrans();
                        }),
                  )
                ],
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
