import 'package:firebase_auth/firebase_auth.dart';
import 'package:gchat/base/baseviewmodel/baseviewmodel.dart';
import 'package:gchat/model/my%20user.dart';
import 'package:gchat/modules/register/registernavigator.dart';
import 'package:gchat/shared/network/remote/databaseutils.dart';
import 'package:gchat/shared/style/costant/constant.dart';

class regiesterviewmodel extends baseviewmodel<regiesternavigator> {
//eth write data enter
  createuser(String emailAddress, String password, String fname, String lname,
      String username, ) async {
    try {
      navigator!.showloading();
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      navigator!.hideloading();
      navigator!.showmassege("Successful");

      myuser users = myuser(fname: fname,
          lname: lname,
          email: emailAddress,
          userName: username,
          id: credential.user?.uid??"");
      databaseutils.addusertofirebase(users).then((value) {
          navigator!.hideloading();
          navigator!.Home(users);
      return;});
    } on FirebaseAuthException catch (e) {
      navigator!.hideloading();
      if (e.code == constant.weakpassword) {
        navigator!.showmassege('The password provided is too weak.');
        navigator!.hideloading();
      } else if (e.code == constant.useemail) {
        navigator!.showmassege('The account already exists for that email.');
        navigator!.hideloading();
      }
    } catch (e) {
      print(e);
    }
  }
}
