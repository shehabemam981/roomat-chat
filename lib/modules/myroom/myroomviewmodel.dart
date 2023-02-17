import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gchat/base/baseviewmodel/baseviewmodel.dart';
import 'package:gchat/model/masseges.dart';
import 'package:gchat/model/room.dart';
import 'package:gchat/modules/myroom/myroomNavigator.dart';
import 'package:gchat/shared/network/remote/databaseutils.dart';

import '../../model/my user.dart';
import '../../repo/uth_repo_contact/impl/impl.dart';

class myroomviewmodel extends baseviewmodel<myroomnavigator>{
  databaseutils database=databaseutils(reposatoryimpl());
  late myuser user;
  late room Room;

  void addmymasseges(String content){
    if(content.trim().isEmpty)return;
    masseges massege=masseges(
        date: DateTime.now().millisecondsSinceEpoch,
        content: content,
        sendername: user.userName,
        sinderid: user.id,
        roomid: Room.id,
    );
    database.repo.addmassegestofirestore(massege)
       .then((value) =>navigator!.clearmassege())
       .catchError((onError)=>navigator!.showmassege(onError.toString()));

  }
  Stream<QuerySnapshot<masseges>> getmymasseges(){
   return database.repo.readmassegesfromfirestore(Room.id);
  }
}