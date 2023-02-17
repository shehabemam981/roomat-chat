import 'package:gchat/base/baseviewmodel/baseviewmodel.dart';
import 'package:gchat/modules/home/homenavigator.dart';
import 'package:gchat/shared/network/remote/databaseutils.dart';

import '../../model/room.dart';
import '../../repo/uth_repo_contact/impl/impl.dart';


class homeviewmodel extends baseviewmodel<homenavigator>{
  databaseutils databaseutols=databaseutils(reposatoryimpl());
  List<room> rooms=[];
  createdroom(){
    return databaseutols.repo.readroomtofirebase()
        .then((value) {
        rooms=value;
        })
        .catchError((onError)=>navigator!.showmassege(onError.toString()),);
  }

}