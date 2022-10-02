import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class PaymentSummaryItem extends StatelessWidget {

  String name;
  String email;
  String phone;
  String total;

  PaymentSummaryItem({required this.name, required this.email, required this.phone, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 2))
        ]
      ),
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Summary",
            style: poppinsText.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: black
            ),
          ),
          SizedBox(height: 13,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Full Name",
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: reguler,
                  color: grey
                ),
              ),
              Text(
                name,
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  color: black
                ),
              )
            ],
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Email Address",
                style: poppinsText.copyWith(
                    fontSize: 14, fontWeight: reguler, color: grey),
              ),
              Text(
                email,
                style: poppinsText.copyWith(
                    fontSize: 14, fontWeight: semiBold, color: black),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Phone Number",
                style: poppinsText.copyWith(
                    fontSize: 14, fontWeight: reguler, color: grey),
              ),
              Text(
                phone,
                style: poppinsText.copyWith(
                    fontSize: 14, fontWeight: semiBold, color: black),
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/linedot.png"),
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: poppinsText.copyWith(
                    fontSize: 16, fontWeight: medium, color: black),
              ),
              Text(
                total,
                style: poppinsText.copyWith(
                    fontSize: 18, fontWeight: semiBold, color: black),
              )
            ],
          ),
        ],
      ),
    );
  }
}