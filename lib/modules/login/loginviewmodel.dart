import 'package:firebase_auth/firebase_auth.dart';
import 'package:gchat/base/baseviewmodel/baseviewmodel.dart';
import 'package:gchat/model/my%20user.dart';
import 'package:gchat/modules/login/loginnavigator.dart';
import 'package:gchat/repo/uth_repo_contact/impl/impl.dart';
import 'package:gchat/shared/network/remote/databaseutils.dart';

class loginViewModel extends baseviewmodel<loginNavigator> {
databaseutils database=databaseutils(reposatoryimpl());
  signin(String emailAddress, String password) async {
    try {
      navigator!.showloading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      navigator!.hideloading();
      navigator!.showmassege("successful");
      myuser? users=await database.repo.login(credential.user?.uid ?? "");
      if(users!=null){
        print('hello');
      navigator!.home(users);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        navigator!.showmassege('No user found for that email.');
        navigator!.hideloading();
      } else if (e.code == 'wrong-password') {
        navigator!.showmassege('Wrong password provided for that user.');
        navigator!.hideloading();
      }
    }
  }
}
