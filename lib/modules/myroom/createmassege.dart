import 'package:flutter/material.dart';
import 'package:gchat/shared/network/remote/myprovider.dart';
import 'package:provider/provider.dart';

import '../../model/masseges.dart';

class sendrmassege extends StatelessWidget {
 masseges massege;
 sendrmassege(this.massege);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight:Radius.circular(10) ,
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.blue,
          ),
            child: Text(massege.content)),
      Text(massege.date.toString().substring(12)),
      ],
    );
  }
}
class reguestmassege extends StatelessWidget {
  masseges massege;
  reguestmassege(this.massege);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight:Radius.circular(10) ,
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.blue,
            ),
            child: Text(massege.content)),
        Text(massege.date.toString().substring(12)),
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
    return provider.users==massege.sinderid?sendrmassege(massege):reguestmassege(massege);
  }
}
