import 'package:gchat/base/baseviewmodel/baseviewmodel.dart';
import 'package:gchat/modules/home/homenavigator.dart';
import 'package:gchat/shared/network/remote/databaseutils.dart';

import '../../model/room.dart';


class homeviewmodel extends baseviewmodel<homenavigator>{
  List<room> rooms=[];
  createdroom(){
    return databaseutils.readroomtofirebase()
        .then((value) {
        rooms=value;
        })
        .catchError((onError)=>navigator!.showmassege(onError.toString()),);
  }

}