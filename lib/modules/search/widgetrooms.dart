import 'package:flutter/material.dart';
import 'package:gchat/modules/myroom/myroomview.dart';
import 'package:gchat/modules/search/myhomeview.dart';

import '../../model/room.dart';

class widgetrooms extends StatelessWidget {
  room rooms;
  widgetrooms(this.rooms);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       Navigator.pushNamed(context, myroomview.RouteName,arguments: rooms, );

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color:Colors.white,
          elevation: 30,
          shadowColor: Colors.blue,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/${rooms.catid}.jpeg",
                height: MediaQuery.of(context).size.width*0.3,
              ),

              Text(rooms.roomName,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
