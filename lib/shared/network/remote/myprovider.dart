import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gchat/model/my%20user.dart';
import 'package:gchat/shared/network/remote/databaseutils.dart';

class myprovider extends ChangeNotifier{
  myuser? users;
  late User? userath;
  myprovider(){
    userath=FirebaseAuth.instance.currentUser;
    if(userath!=null) {
    initcurrentuser();

    }}
    initcurrentuser()async{
      users =await databaseutils.readuserfromfirebase(userath?.uid??'');

    }

}