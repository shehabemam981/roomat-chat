import 'package:flutter/material.dart';
import 'package:gchat/base/baseview/baseview.dart';

import 'package:gchat/modules/createroom/creareroomviewmodel.dart';
import 'package:gchat/modules/createroom/createroomnavigator.dart';
import 'package:gchat/shared/network/remote/myprovider.dart';
import 'package:gchat/shared/style/themes/color.dart';
import 'package:provider/provider.dart';




import '../../model/categoryitems.dart';

class createroomview extends StatefulWidget {
 static const String RouteName="room";

  @override
  State<createroomview> createState() => _createroomviewState();
}

class _createroomviewState extends baseview<createRoomViewModel,createroomview> implements createroomnavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.navigator=this;

  }
 var categoriess=categoryitem.categories();
  categoryitem? selectedcategory;
  var formkey=GlobalKey<FormState>();
  var nameroomcontroller=TextEditingController();
  var discrebtioncontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<myprovider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:(pro.themes==ThemeMode.light)? Colors.transparent:BLACK_COLOR,
       iconTheme:IconThemeData(color: PRIMARY_COLOR) ,
        title: Text("Create Room",style: TextStyle(fontWeight:FontWeight.bold ,fontSize:30 ,color: PRIMARY_COLOR,),),
        centerTitle: true,
        elevation: 0.0,
      ),
            body: Card(
        shadowColor: Colors.blue,
        elevation: 50,
        margin: EdgeInsets.symmetric(vertical: 180,horizontal: 20),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(80),
            topLeft: Radius.circular(80),
            bottomLeft: Radius.circular(80),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Create your Room",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.blue,
                ),
                  textAlign: TextAlign.center,),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator:(text){
                    if(text==null|| text.isEmpty){
                      return "please enter your name room";
                    }
                  } ,
                 controller: nameroomcontroller,
                  decoration: InputDecoration(
                    hintText: "enter your name room",
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 4,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ) ,
                    border:OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 4,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ) ,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                DropdownButton<categoryitem>(
                  value: selectedcategory,
                    items:categoriess.map((e) => DropdownMenuItem<categoryitem>(
                           value: e,
                        child:Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Image.asset(e.image),
                              SizedBox(width: 4,),
                              Text(e.namecat),
                            ],
                          ),
                        ) )).toList(),

                    onChanged:(index){
                    if(index==null)return;
                    selectedcategory=index;
                    setState((){});
          }, ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator:(text){
                    if(text==null|| text.isEmpty){
                      return "please enter your description";
                    }
                  } ,
                  controller: discrebtioncontroller,
                  decoration: InputDecoration(
                    hintText: "enter your description ",
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 4,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ) ,
                    border:OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 4,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ) ,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: (){
                  createdroom();
                }, child: Text("Create Acount"),),

              ],
            ),
          ),
        ),
      ),
    );
  }
  createdroom(){
    if(formkey.currentState!.validate()){
      model.createroominfirebase(nameroomcontroller.text, discrebtioncontroller.text,selectedcategory!.catid );
    }
  }
  @override
  viewmodel() {
   return createRoomViewModel();
  }

  @override
  gotoMyRoom() {

Navigator.pop(context);

  }
}
