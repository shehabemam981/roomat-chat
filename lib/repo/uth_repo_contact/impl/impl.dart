// import 'package:gchat/model/my%20user.dart';
// import 'package:gchat/repo/uth_repo_contact/uth/ath.dart';
// import 'package:gchat/shared/network/remote/databaseutils.dart';
//
// class athfirebasedatasourceimpl implements athfirebasedatasource{
//   databaseutils database;
//   athfirebasedatasourceimpl(this.database);
//   @override
//   Future<myuser?> login(String id)async {
//   var response= await database.readuserfromfirebase(id);
//   return response;
//   }
//
//   @override
//   Future<void> register(myuser users)async {
//  var responce=await database.addusertofirebase(users);
//  return responce;
//   }
//
// }
// class athreposatoryimpl implements reposatoryath{
//   athfirebasedatasource data;
//   athreposatoryimpl(this.data);
//   @override
//   Future<String?> login(String id) async{
//   var responce=await data.login(id);
//   return responce?.id;
//
//   }
//
//   @override
//   Future<String?> register(myuser users)async {
// var responce=await data.register(users);
//   return responce=users.id;
//   }
//
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gchat/model/masseges.dart';
import 'package:gchat/model/my%20user.dart';
import 'package:gchat/model/room.dart';
import 'package:gchat/repo/uth_repo_contact/uth/ath.dart';

class reposatoryimpl implements reposatoryath{
  @override
  Future<myuser?> login(String id)async {
    DocumentSnapshot<myuser> getdata= await getuserCollection().doc(id).get();
    var uusers=getdata.data();
    return uusers;
  }

  @override
  Future<void> register(myuser users) {
    DocumentReference<myuser> docref = getuserCollection().doc(users.id);
    users.id = docref.id;
    return docref.set(users);
  }

  @override
  CollectionReference<myuser> getuserCollection() {
    return FirebaseFirestore.instance.collection("myuser").withConverter<myuser>(
        fromFirestore: (snapshot, options) =>myuser.fromjson(snapshot.data()!) ,
        toFirestore:(value,option)=> value.toJson());
  }

  @override
  Future<void> addmassegestofirestore(masseges mymasseges) {
    DocumentReference<masseges>  docref= getmassegecollection(mymasseges.roomid).doc();
    mymasseges.id= docref.id;
    return docref.set(mymasseges);
  }

  @override
  Future<void> addroomstofirebase(room myroom) {
    DocumentReference<room> docref=getroomCollection().doc();
    myroom.id=docref.id;
    return docref.set(myroom);
  }

  @override
  CollectionReference<masseges> getmassegecollection(String roomid) {
    return getroomCollection().doc(roomid).collection("masseges").withConverter<masseges>(
      fromFirestore:(snapshot, options) => masseges.fromJson(snapshot.data()!) ,
      toFirestore:(value,options)=>value.tojson() ,);
  }

  @override
  CollectionReference<room> getroomCollection() {
    return FirebaseFirestore.instance.collection("room").withConverter<room>(
      fromFirestore: (snapshot, options) =>room.fromJson(snapshot.data()!)
      , toFirestore: (value,options)=>value.toJson(),);
  }

  @override
  Stream<QuerySnapshot<masseges>> readmassegesfromfirestore(String roomid) {
    return getmassegecollection(roomid).orderBy("date").snapshots();
  }

  @override
  Future<List<room>> readroomtofirebase()async{
    QuerySnapshot<room> snaproom=await getroomCollection().get();
    return snaproom.docs.map((e) => e.data()).toList();
  }

}