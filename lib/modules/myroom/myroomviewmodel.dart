import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gchat/base/baseviewmodel/baseviewmodel.dart';
import 'package:gchat/model/masseges.dart';
import 'package:gchat/model/room.dart';
import 'package:gchat/modules/myroom/myroomNavigator.dart';
import 'package:gchat/shared/network/remote/databaseutils.dart';

import '../../model/my user.dart';

class myroomviewmodel extends baseviewmodel<myroomnavigator>{
   late room Room;
  late myuser user;
  void addmymasseges(String content){
    if(content.trim().isEmpty)return;
    masseges massege=masseges(
        date: DateTime.now().millisecondsSinceEpoch,
        content: content,
        sendername: user.userName,
        sinderid: user.id,
        roomid: Room.id,
    );
    databaseutils.addmassegestofirestore(massege)
       .then((value) =>navigator!.clearmassege())
       .catchError((onError)=>navigator!.showmassege(onError.toString()));

  }
  Stream<QuerySnapshot<masseges>> getmymasseges(){
   return databaseutils.readmassegesfromfirestore(Room.id);
  }
}