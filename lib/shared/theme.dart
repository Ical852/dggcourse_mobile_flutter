// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

String baseUrl = "http://192.168.100.3:8080/api";
String imageUrl = "http://192.168.100.3/shamo-backend/public/storage/images/";

String formatter(int number) {
  var formatted = intl.NumberFormat.decimalPattern().format(number);

  return formatted;
}


String article_img = imageUrl + "article/";
String category_img = imageUrl + "category/";
String course_img = imageUrl + "course/";
String mentor_img = imageUrl + "mentor/";
String tool_img = imageUrl + "tool/";
String user_img = imageUrl + "user/";

Color primaryColor = Color(0xff5589F0);
Color secondaryColor = Color(0xff4E82EA);

Color black = Color(0xff081D43);
Color grey = Color(0xff9698A9);
Color grey2 = Color(0xffA2ADB1);
Color grey3 = Color(0xffB7B7B7);
Color white = Color(0xffFFFFFF);
Color red = Color(0xffFF7A7A);
Color green = Color(0xff22B07D);
Color yellow = Color(0xffFFBC58);
Color blue1 = Color(0xff6D9CFA);
Color blue2 = Color(0xffE4EDFF);
Color blue3 = Color(0xffD1E2FD);

TextStyle poppinsText = GoogleFonts.poppins();

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight blackBold = FontWeight.w900;