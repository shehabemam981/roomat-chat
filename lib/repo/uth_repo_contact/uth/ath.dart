import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/masseges.dart';
import '../../../model/my user.dart';
import '../../../model/room.dart';

abstract class reposatoryath{
  CollectionReference<myuser> getuserCollection();
  Future<myuser?> login(String id);
  Future <void> register(myuser users );
   CollectionReference<room> getroomCollection();
  Future<void> addroomstofirebase(room myroom);
  Future<List<room>> readroomtofirebase();
  CollectionReference<masseges> getmassegecollection(String roomid);
  Future<void> addmassegestofirestore(masseges mymasseges);
  Stream<QuerySnapshot<masseges>> readmassegesfromfirestore(String roomid);
}
// abstract class athfirebasedatasource{
//   Future<myuser?>  login(String id);
//   Future <void> register(myuser users);
// }