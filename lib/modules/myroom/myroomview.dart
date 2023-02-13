import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gchat/base/baseview/baseview.dart';
import 'package:gchat/model/masseges.dart';
import 'package:gchat/model/room.dart';
import 'package:gchat/modules/myroom/createmassege.dart';
import 'package:gchat/modules/myroom/myroomNavigator.dart';
import 'package:gchat/modules/myroom/myroomviewmodel.dart';
import 'package:gchat/shared/network/remote/myprovider.dart';
import 'package:provider/provider.dart';

class myroomview extends StatefulWidget {
static const String RouteName="myroom";

  @override
  State<myroomview> createState() => _myroomviewState();
}

class _myroomviewState extends baseview<myroomviewmodel,myroomview> implements myroomnavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.navigator=this;
  }

  var textController=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)!.settings.arguments as room;
    var provider = Provider.of<myprovider>(context);
    // print(provider.users!.id);
    model.user = provider.users!;
    model.Room = args;


    return ChangeNotifierProvider(
      create: (BuildContext context) =>model,
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.roomName),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 36),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Image.asset("assets/images/${args.catid}.jpeg"),
                    StreamBuilder<QuerySnapshot<masseges>>(
                        stream: model.getmymasseges(),
                        builder:(context,snapshot){
                          if(snapshot.hasError){
                            return Image.asset("assets/images/loading.gif");
                          }

                         else if (snapshot.connectionState == ConnectionState.waiting) {
                            return Image.asset("assets/images/loading.gif");
                          }
                          var massege=snapshot.data?.docs.map((e) => e.data()).toList();
                          return ListView.builder(
                            itemBuilder:(context, index) => createmassege(massege![index]),
                          itemCount:massege?.length??0,
                          );
                        } ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        controller:textController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border:OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Colors.blue,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ) ,
                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ) ,
                        hintText: "write your text",
                        hintStyle: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      ),
                    ),
                  ),
                  SizedBox(width: 6,),
                  ElevatedButton(onPressed: (){},
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Send"),
                      Icon(Icons.send),
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  viewmodel() {
    return myroomviewmodel();
  }

  @override
  clearmassege() {
    textController.clear();
  }
}
