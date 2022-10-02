import 'package:dggcourses/cubit/article_cubit.dart';
import 'package:dggcourses/cubit/homearticle_cubit.dart';
import 'package:dggcourses/pages/home_page.dart';
import 'package:dggcourses/pages/katalogpage.dart';
import 'package:dggcourses/pages/profilepage.dart';
import 'package:dggcourses/pages/savedpage.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/menuitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var currentPage = 1;

  @override
  Widget build(BuildContext context) {

    Widget renderPage() {
      return currentPage == 1 ? HomePage() :
            currentPage == 2 ? KatalogPage() :
            currentPage == 3 ? SavedPage() : ProfilePage();
    }

    Widget bottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 71,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(0, 2))
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuItem(
                title: "Home",
                selected: currentPage == 1,
                img: currentPage == 1 ? "assets/ic_menu_home_active.png" : "assets/ic_menu_home.png",
                onPress: (){
                  this.setState(() {
                    currentPage = 1;
                  });
                },
              ),
              MenuItem(
                title: "Katalog",
                selected: currentPage == 2,
                img: currentPage == 2 ? "assets/ic_menu_katalog_active.png" :  "assets/ic_menu_katalog.png",
                onPress: (){
                  this.setState(() {
                    currentPage = 2;
                  });
                },
              ),
              MenuItem(
                title: "Saved",
                selected: currentPage == 3,
                img: currentPage == 3 ? "assets/ic_menu_saved_active.png" :  "assets/ic_menu_saved.png",
                onPress: (){
                  this.setState(() {
                    currentPage = 3;
                  });
                },
              ),
              MenuItem(
                title: "Profile",
                selected: currentPage == 4,
                img: currentPage == 4 ? "assets/ic_menu_profile_active.png" :  "assets/ic_menu_profile.png",
                onPress: (){
                  this.setState(() {
                    currentPage = 4;
                  });
                },
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            renderPage(),
            bottomNav()
          ],
        ),
      ),
    );
  }
}