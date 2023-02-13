import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gchat/base/baseview/baseview.dart';
import 'package:gchat/modules/createroom/createroomview.dart';

import 'package:gchat/modules/home/homenavigator.dart';
import 'package:gchat/modules/home/homeviewmodel.dart';
import 'package:gchat/modules/login/loginview.dart';
import 'package:gchat/modules/setting/settingview.dart';
import 'package:provider/provider.dart';

import '../search/myhomeview.dart';

class homeview extends StatefulWidget {
  static const String RouteName = "home";

  @override
  State<homeview> createState() => _homeviewState();
}

class _homeviewState extends baseview<homeviewmodel, homeview>
    implements homenavigator {
  @override

  int currentuser=0;
  List<Widget> screens = [
    myhomeview(),
    settingview(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.navigator = this;
    model.createdroom();
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    model.navigator = this;
    model.createdroom();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>model,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                signout();
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape:StadiumBorder(
            side: BorderSide(
              color: Colors.white,
              width: 4,
            )
          ),
          onPressed: () {
            Navigator.pushNamed(context, createroomview.RouteName);
          },
          child: Icon(Icons.family_restroom),
        ),
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 12,
            color: Colors.blue,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
                elevation: 0.0,
                currentIndex: currentuser,
                onTap: (index){
                currentuser=index;
                setState((){});
                },
                items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,color: Colors.white,),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: "",
              ),
            ]),),
        body: screens[currentuser],
      ),
    );
  }

  @override
  viewmodel() {
    return homeviewmodel();
  }

  signout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, loginview.RouteName);
    setState(() {});
  }
}
