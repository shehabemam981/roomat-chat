class room{

  String id;
  String roomName;
  String discrebtion;
  String  catid;
  room({
     this.id="",
    required this.roomName,
    required this.discrebtion,
    required this.catid,
});
  room.fromJson(Map<String,dynamic> json)
      :this(
    id:json["id"],
    roomName:json["roomName"],
    discrebtion:json["discrebtion"],
    catid:json["catid"],
  );

  Map<String,dynamic> toJson(){
    return{
      "id":id,
  "roomName":roomName,
  "discrebtion":discrebtion,
  "catid":catid,
  };
}
}