import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gchat/model/my%20user.dart';
import 'package:gchat/shared/network/remote/databaseutils.dart';

import '../../../repo/uth_repo_contact/impl/impl.dart';

class myprovider extends ChangeNotifier{
  myuser? users;
  late User? userath;
  ThemeMode themes=ThemeMode.light;
  databaseutils database=databaseutils(reposatoryimpl());
  void changethemes(ThemeMode theme){
    themes=theme;
    notifyListeners();
  }
  myprovider(){
    userath=FirebaseAuth.instance.currentUser;
    if(userath!=null) {
    initcurrentuser();

    }}
    initcurrentuser()async{
      users =await database.repo.login(userath?.uid??'');

    }

}