class myuser{
  String? fname;
  String? lname;
  String? email;
  String id;
  String userName;
  myuser({required this.id,required this.fname,required this.lname,required this.email,required this.userName});
  Map<String,dynamic> toJson(){
    return{
      'fname':fname,
  'lname':lname,
  'email':email,
  'id':id,
  'userName':userName,
  };
}
myuser.fromjson(Map<String,dynamic>json):this(
  fname:json["fname"],
  lname:json["lname"],
  email:json["email"],
  id:json["id"],
  userName:json["userName"],
);
}