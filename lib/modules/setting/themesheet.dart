import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/network/remote/myprovider.dart';

class Themesheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<myprovider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
            onTap: (){
              pro.changethemes(ThemeMode.light);
              Navigator.pop(context);
            },
            child: items(context, "light", pro.themes==ThemeMode.light)),
        SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: (){
              pro.changethemes(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: items(context, "dark", pro.themes==ThemeMode.dark)),
      ],
    );
  }

  Widget items(context, String name, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: (isSelected) ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color:(isSelected)? Colors.white:Colors.blue,
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(0, 15)
            ),
          ]
        ),
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: (!isSelected)?Theme.of(context).textTheme.headline1?.copyWith(
                color: Colors.blue,)
                :Theme.of(context).textTheme.headline1?.copyWith(
                color: Colors.white,
              ),
            ),
            Icon(Icons.done),
          ],
        ),
      ),
    );
  }
}