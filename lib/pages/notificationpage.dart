import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/authbutton.dart';
import 'package:dggcourses/widgets/headeroback.dart';
import 'package:dggcourses/widgets/notifitem.dart';
import 'package:dggcourses/widgets/toggle.dart';
import 'package:dggcourses/widgets/tscnotifitem.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  var currentToggle = "left";
  var notif = true;
  var transaction = true;

  @override
  Widget build(BuildContext context) {
    
    Widget emptyTransactions() {
      return Container(
        margin: EdgeInsets.only(
          top: 80
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/emptytransaction.png")
                  )
                ),
              ),
              SizedBox(height: 30,),
              Text(
                "No Transactions Yet",
                style: poppinsText.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 6),
                width: 250,
                child: Text(
                  "Seems like you have not purchased any course or top up yet",
                  style: poppinsText.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                    color: grey
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 30
                ),
                width: 200,
                child: AuthButton(
                  text: "Go to Home",
                  onPress: (){
                    Navigator.pushNamed(context, "/main-page");
                  },
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget transactions() {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
          left: 24,
          right: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Transactions",
              style: poppinsText.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 16,),
            TscNotifItem(
              title: "Top Up Dgg Money",
              desc: "DggM + IDR 575.000",
              date: "20 May",
              status: "Success",
              textStat: "success",
            ),
            TscNotifItem(
              title: "Class : UI / UX Design Web Apps",
              desc: "DggM - IDR 275.000",
              date: "20 May",
              status: "Success",
              textStat: "danger",
            ),
            TscNotifItem(
              title: "Class : UI / UX Design Mobile Apps",
              desc: "DggM - IDR 275.000",
              date: "20 May",
              status: "Failed",
              textStat: "danger",
            ),
            TscNotifItem(
              title: "Class : UI / UX Design Mobile Apps",
              desc: "Via Midtrans - IDR 275.000",
              date: "20 May",
              status: "Success",
              textStat: "midtrans",
            ),
            SizedBox(height: 50,)
          ],
        ),
      );
    }

    Widget emptyNotifications() {
      return Container(
        margin: EdgeInsets.only(
          top: 80
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/emptynotif.png")
                  )
                ),
              ),
              Text(
                "No Notifications Yet",
                style: poppinsText.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 6),
                width: 179,
                child: Text(
                  "Seems like there is no any notifications for you yet",
                  style: poppinsText.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                    color: grey
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 30
                ),
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
      );
    }

    Widget notifications() {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
          left: 24,
          right: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account Info",
              style: poppinsText.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 16,),
            NotifItem(
              title: "Your account has been verified",
              desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
              date: "20 May",
            ),
            NotifItem(
              title: "You got Dgg Money Bonus !!!",
              desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
              date: "20 May",
            ),
            NotifItem(
              title: "New user promo, Check it out !!!",
              desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
              date: "20 May",
            ),
            NotifItem(
              title: "New class promos, Check it out !!!",
              desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
              date: "20 May",
            ),
            SizedBox(height: 50,)
          ],
        ),
      );
    }

    Widget renderTransactions() {
      return transaction ? transactions() : emptyTransactions();
    }

    Widget renderNotif() {
      return notif ? notifications() : emptyNotifications();
    }

    Widget renderContent() {
      return currentToggle == "left" ? renderNotif() : renderTransactions();
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            HeaderBackOnly(title: "Notifications"),
            Container(
              margin: EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24
              ),
              child: Toggle(
                currentToggle: currentToggle,
                left: "Notifications",
                right: "Transactions",
                leftPress: (){
                  this.setState(() {
                    currentToggle = "left";
                  });
                },
                rightPress: (){
                  this.setState(() {
                    currentToggle = "right";
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 24
              ),
              height: 1,
              color: Color(0xffEEEEEE),
            ),
            renderContent()
          ],
        ),
      ),
    );
  }
}