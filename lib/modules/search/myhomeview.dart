import 'package:flutter/material.dart';
import 'package:gchat/modules/search/widgetrooms.dart';
import 'package:provider/provider.dart';

import '../home/homeviewmodel.dart';

class myhomeview extends StatefulWidget {


  @override
  State<myhomeview> createState() => _myhomeviewState();
}

class _myhomeviewState extends State<myhomeview> {

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return  Consumer<homeviewmodel>(
        builder: (context, value, child) {
          return GridView.builder(
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ) ,
            itemBuilder:(context,index)=>widgetrooms(value.rooms[index]),
            itemCount: value.rooms.length,);

        },

    );
  }
}
