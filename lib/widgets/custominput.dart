import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {

  String title;
  TextEditingController controller;
  bool secure;

  CustomInput({required this.title, required this.controller, this.secure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: poppinsText.copyWith(
              fontSize: 14,
              color: black,
              fontWeight: reguler
            ),
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            obscureText: secure,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
                borderSide: BorderSide(
                  color: blue3
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
                borderSide: BorderSide(
                  color: primaryColor
                )
              ),
              contentPadding: EdgeInsets.only(
                right: 20,
                left: 20,
                top: 14,
                bottom: 17
              )
            ),
          )
        ],
      ),
    );
  }
}