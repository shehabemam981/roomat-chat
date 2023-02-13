import 'package:flutter/material.dart';
import 'package:gchat/base/baseview/baseview.dart';
import 'package:gchat/model/my%20user.dart';
import 'package:gchat/modules/home/homeView.dart';
import 'package:gchat/modules/login/loginnavigator.dart';
import 'package:gchat/modules/login/loginviewmodel.dart';
import 'package:gchat/modules/register/regesterview.dart';
import 'package:gchat/shared/network/remote/myprovider.dart';
import 'package:provider/provider.dart';

class loginview extends StatefulWidget {
  static const String RouteName = "login";

  @override
  State<loginview> createState() => _loginviewState();
}

class _loginviewState extends baseview<loginViewModel, loginview>
    implements loginNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.navigator = this;
  }
  bool obscuretext=true;
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => model,
      child: Scaffold(
        body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    child: Image.asset("assets/images/cover.png"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "please enter your email";
                      }
                    },
                    textAlign: TextAlign.start,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "your email",
                      hintText: "please enter your email",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "please enter your first name";
                      }
                    },
                    textAlign: TextAlign.start,
                    controller: passwordcontroller,
                    obscureText: obscuretext,
                    decoration: InputDecoration(
                      suffixIcon: (obscuretext)
                          ? InkWell(
                          onTap: () {
                            obscuretext = false;
                            setState(() {});
                          },
                          child: Icon(Icons.visibility))
                          : InkWell(
                          onTap: () {
                            obscuretext = true;
                            setState(() {});
                          },
                          child: Icon(Icons.visibility_off)),
                      labelText: "password",
                      hintText: "please enter your password",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        validateform();
                      },
                      child: Text("On Submit")),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("I don\t have email"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, registerview.routename);
                          },
                          child: Text(
                            "Click here",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                      ),
                    ],
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
  validateform(){
 if(formkey.currentState!.validate()){
   return model.signin(emailController.text, passwordcontroller.text);
 }
  }

  @override
  viewmodel() {
    return loginViewModel();
  }

  @override
  home( myuser user) {
    var pro =Provider.of<myprovider>(context,listen: false);
    pro.users=user;
   Navigator.pushReplacementNamed(context, homeview.RouteName);

  }
}
