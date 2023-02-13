import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gchat/modules/createroom/createroomview.dart';
import 'package:gchat/modules/home/homeView.dart';
import 'package:gchat/modules/login/loginview.dart';
import 'package:gchat/modules/register/regesterview.dart';
import 'package:gchat/shared/network/remote/myprovider.dart';
import 'package:provider/provider.dart';

import 'modules/myroom/myroomview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => myprovider(),
      child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<myprovider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          (pro.userath != null) ? homeview.RouteName : loginview.RouteName,
      routes: {
        registerview.routename: (c) => registerview(),
        homeview.RouteName: (c) => homeview(),
        loginview.RouteName: (c) => loginview(),
        createroomview.RouteName: (c) => createroomview(),
        myroomview.RouteName: (c) => myroomview(),

      },
    );
  }
}
