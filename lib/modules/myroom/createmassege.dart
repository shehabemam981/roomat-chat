import 'package:flutter/material.dart';
import 'package:gchat/shared/network/remote/myprovider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/masseges.dart';

class reguestmassege extends StatelessWidget {
 masseges massege;
 reguestmassege(this.massege);



  @override
  Widget build(BuildContext context) {
    int ts = massege.date;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);

    var dataa= DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            padding: EdgeInsets.all(10),
          margin:  EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight:Radius.circular(10) ,
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.white,
          ),
            child: Text(massege.content)),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(dataa.substring(12))),
      ],
    );
  }
}
class sendermassege extends StatelessWidget {
  masseges massege;
  sendermassege(this.massege);

  @override
  Widget build(BuildContext context) {
    var dt=DateTime.fromMicrosecondsSinceEpoch(massege.date);
    var dataa=DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:  EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight:Radius.circular(10) ,
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.blue,
            ),
            child: Text(massege.content)),
        Container(

            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(dataa.substring(12)),
        ),
      ],
    );
  }
}
class createmassege extends StatelessWidget {
 masseges massege;
 createmassege(this.massege);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<myprovider>(context);
    return (provider.users?.id==massege.sinderid)?sendermassege(massege):reguestmassege(massege);
  }
}
