import 'package:flutter/material.dart';
import 'package:gchat/base/baseview/baseview.dart';
import 'package:gchat/model/my%20user.dart';
import 'package:gchat/modules/home/homeView.dart';
import 'package:gchat/modules/login/loginview.dart';
import 'package:gchat/modules/register/registernavigator.dart';
import 'package:gchat/modules/register/registerviewmodel.dart';
import 'package:provider/provider.dart';

import '../../shared/network/remote/myprovider.dart';

class registerview extends StatefulWidget {
  static const String routename = "register";

  @override
  State<registerview> createState() => _registerState();
}

class _registerState extends baseview<regiesterviewmodel, registerview>
    implements regiesternavigator {
  @override
  void initState() {
    super.initState();
    model.navigator = this;
  }

  var FirstNameControoler = TextEditingController();
  var LastNameControoler = TextEditingController();
  var emailController = TextEditingController();
  var UserNameController = TextEditingController();
  var PasswordController = TextEditingController();
  bool obscuretext = true;
  var formkey = GlobalKey<FormState>();

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
                      return "please enter your first name";
                    }
                  },
                  textAlign: TextAlign.start,
                  controller: FirstNameControoler,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    hintText: "please enter your First Name",
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
                  controller: LastNameControoler,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    hintText: "please enter your Last Name",
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
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(text);
                    if (!emailValid) {
                      return "enter valid email";
                    }
                  },
                  textAlign: TextAlign.start,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "email",
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
                  controller: UserNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "User Name",
                    hintText: "please enter your User Name",
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
                  controller: PasswordController,
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
                    Text("I have email"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, loginview.RouteName);
                        },
                        child: Text(
                          "Click here",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  viewmodel() {
    return regiesterviewmodel();
  }

  validateform() {
    if (formkey.currentState!.validate()) {
      return model.createuser(
          emailController.text,
          PasswordController.text,
          FirstNameControoler.text,
          LastNameControoler.text,
          UserNameController.text,

      );
    }
  }
  @override
  Home(myuser userss) {
    var pro=Provider.of<myprovider>(context,listen: false);
    pro.users=userss;
   Navigator.pushReplacementNamed(context, homeview.RouteName);
  }
}
