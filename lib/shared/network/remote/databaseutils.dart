

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:gchat/model/masseges.dart';
// import 'package:gchat/model/my%20user.dart';
// import 'package:gchat/model/room.dart';

import '../../../repo/uth_repo_contact/uth/ath.dart';

class databaseutils {
  reposatoryath repo;
  databaseutils(this.repo);}
 //  // static CollectionReference<myuser> getuserCollection(){
 //  //  return FirebaseFirestore.instance.collection("myuser").withConverter<myuser>(
 //  //       fromFirestore: (snapshot, options) =>myuser.fromjson(snapshot.data()!) ,
 //  //       toFirestore:(value,option)=> value.toJson());
 //  // }
 //  //
 //  //  static Future<void> addusertofirebase(myuser users) {
 //  //    DocumentReference<myuser> docref = getuserCollection().doc(users.id);
 //  //    users.id = docref.id;
 //  //    return docref.set(users);
 //  //
 //  // }
 //  // static Future<myuser?> readuserfromfirebase(String id)async{
 //  //   DocumentSnapshot<myuser> getdata= await getuserCollection().doc(id).get();
 //  //   var uusers=getdata.data();
 //  //   return uusers;
 //  // }
 //
 // static CollectionReference<room> getroomCollection(){
 //    return FirebaseFirestore.instance.collection("room").withConverter<room>(
 //      fromFirestore: (snapshot, options) =>room.fromJson(snapshot.data()!)
 //      , toFirestore: (value,options)=>value.toJson(),);
 //  }
 //  static Future<void> addroomstofirebase(room myroom){
 //    DocumentReference<room> docref=getroomCollection().doc();
 //     myroom.id=docref.id;
 //     return docref.set(myroom);
 //  }
 //  static Future<List<room>> readroomtofirebase()async{
 //    QuerySnapshot<room> snaproom=await getroomCollection().get();
 //    return snaproom.docs.map((e) => e.data()).toList();
 //  }
 //  static CollectionReference<masseges> getmassegecollection(String roomid){
 //    return getroomCollection().doc(roomid).collection("masseges").withConverter<masseges>(
 //      fromFirestore:(snapshot, options) => masseges.fromJson(snapshot.data()!) ,
 //      toFirestore:(value,options)=>value.tojson() ,);
 //  }
 //  static Future<void> addmassegestofirestore(masseges mymasseges){
 //    DocumentReference<masseges>  docref= getmassegecollection(mymasseges.roomid).doc();
 //  mymasseges.id= docref.id;
 //   return docref.set(mymasseges);
 //  }
 //  static Stream<QuerySnapshot<masseges>> readmassegesfromfirestore(String roomid){
 //    return getmassegecollection(roomid).orderBy("date").snapshots();

