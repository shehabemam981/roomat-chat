import 'package:gchat/base/baseviewmodel/baseviewmodel.dart';
import 'package:gchat/model/room.dart';
import 'package:gchat/modules/createroom/createroomnavigator.dart';
import 'package:gchat/shared/network/remote/databaseutils.dart';

class createRoomViewModel extends baseviewmodel<createroomnavigator>{
   createroominfirebase(String roomName,String discrebtion,String catid){
     room myroom=room(roomName: roomName, discrebtion: discrebtion, catid: catid);
     return databaseutils.addroomstofirebase(myroom).then((value){
       navigator!.gotoMyRoom();

       notifyListeners();
     }).catchError((error) => navigator!.showmassege(error.toString()));
   }
}