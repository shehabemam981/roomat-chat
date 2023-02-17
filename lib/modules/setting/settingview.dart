import 'package:flutter/material.dart';
import 'package:gchat/base/baseview/baseview.dart';
import 'package:gchat/modules/setting/settingnavigator.dart';
import 'package:gchat/modules/setting/settingviewmodel.dart';
import 'package:gchat/modules/setting/themesheet.dart';
import 'package:gchat/shared/network/remote/myprovider.dart';
import 'package:provider/provider.dart';

class settingview extends StatefulWidget {
static const String RouteName="setting";
  @override
  State<settingview> createState() => _settingviewState();
}

class _settingviewState extends baseview<settingviewmodel,settingview> implements settingnavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.navigator=this;
  }
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<myprovider>(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) =>model,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 70),
        height:60 ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.blue,
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(0, 15),
            ),
          ],
        color: Colors.white,
        ),

      child: InkWell(
        onTap: (){
          bottomsheet();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text((pro.themes==ThemeMode.light)?"light":"dark",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.blue
              ),
              ),
              Icon(Icons.arrow_drop_down_outlined),
            ],
          ),
        ),
      ),
      ),
    );
  }

  @override
  viewmodel() {
    return settingviewmodel();
  }

  @override
  bottomsheet() {
  showModalBottomSheet(context: context, builder:(context){
    return Themesheet();
  } );
  }
}
