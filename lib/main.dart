//@dart=2.9

import 'package:dggcourses/cubit/article_cubit.dart';
import 'package:dggcourses/cubit/category_cubit.dart';
import 'package:dggcourses/cubit/categorycourse_cubit.dart';
import 'package:dggcourses/cubit/course_cubit.dart';
import 'package:dggcourses/cubit/favorite_cubit.dart';
import 'package:dggcourses/cubit/homearticle_cubit.dart';
import 'package:dggcourses/cubit/homecourse_cubit.dart';
import 'package:dggcourses/cubit/notification_cubit.dart';
import 'package:dggcourses/cubit/topup_cubit.dart';
import 'package:dggcourses/cubit/transaction_cubit.dart';
import 'package:dggcourses/cubit/user_cubit.dart';
import 'package:dggcourses/cubit/usercourse_cubit.dart';
import 'package:dggcourses/pages/articledetail.dart';
import 'package:dggcourses/pages/articlespage.dart';
import 'package:dggcourses/pages/bonus.dart';
import 'package:dggcourses/pages/buyclasssuccess.dart';
import 'package:dggcourses/pages/changepassword.dart';
import 'package:dggcourses/pages/chatpage.dart';
import 'package:dggcourses/pages/detail_page.dart';
import 'package:dggcourses/pages/getstarted.dart';
import 'package:dggcourses/pages/interest.dart';
import 'package:dggcourses/pages/mainpage.dart';
import 'package:dggcourses/pages/mentorpage.dart';
import 'package:dggcourses/pages/notificationpage.dart';
import 'package:dggcourses/pages/paidcourse.dart';
import 'package:dggcourses/pages/paymentsum.dart';
import 'package:dggcourses/pages/reset.dart';
import 'package:dggcourses/pages/sign-in.dart';
import 'package:dggcourses/pages/sign-up.dart';
import 'package:dggcourses/pages/splash.dart';
import 'package:dggcourses/pages/topup.dart';
import 'package:dggcourses/pages/topupsuccess.dart';
import 'package:dggcourses/pages/topupsummary.dart';
import 'package:dggcourses/pages/updateprofile.dart';
import 'package:dggcourses/pages/usercourses.dart';
import 'package:dggcourses/pages/wannabe.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ArticleCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => CategorycourseCubit()),
        BlocProvider(create: (context) => CourseCubit()),
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => HomearticleCubit()),
        BlocProvider(create: (context) => HomecourseCubit()),
        BlocProvider(create: (context) => NotificationCubit()),
        BlocProvider(create: (context) => TopupCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => UsercourseCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/" :(context) => SplashPage(),
          "/get-started": (context) => GetStarted(),
          "/sign-up":(context) => SignUp(),
          "/sign-in":(context) => SignIn(),
          "/reset" :(context) => ResetPage(),
          "/interest":(context) => InterestPage(),
          "/main-page":(context) => MainPage(),
          "/top-up":(context) => TopUpPage(),
          "/top-up-success":(context) => TopUpSuccess(),
          "/articles":(context) => ArticlesPage(),
          "/notif-page":(context) => NotificationPage(),
          "/update-profile":(context) => UpdateProfilePage(),
          "/changepw":(context) => ChangePassword(),
          "/my-courses":(context) => UserCourses(),
        },
      ),
    );
  } 
}