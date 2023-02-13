import 'package:flutter/material.dart';
import 'package:gchat/base/basenavigator/basenavigator.dart';
import 'package:gchat/base/baseviewmodel/baseviewmodel.dart';

 abstract class baseview <vm extends baseviewmodel,t extends StatefulWidget> extends State<t> implements basenavigator{
 late vm model;
  viewmodel();
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model=viewmodel();
  }
  @override
  hideloading(){
   return Navigator.pop(context);
  }

  @override
  void showloading({String massege="loading"}){
   showDialog(context: context, builder: (context){
     return AlertDialog(
      title: Row(
       children: [
         CircularProgressIndicator(),
       SizedBox(width:10),
        Text(massege),
       ]
      ),
   );
   });
  }

  @override
  showmassege(String massege){
   showDialog(context: context, builder: (context){
    return AlertDialog(
     title: Text(massege),
    );
   });
  }
}
