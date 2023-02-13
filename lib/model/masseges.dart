class masseges {
  String id;
  String roomid;
  String sinderid;
  String sendername;
  int date;
  String content;

  masseges(
      {this.id = "",
      required this.date,
      required this.content,
      required this.sendername,
      required this.sinderid,
      required this.roomid});

  masseges.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          date: json["date"],
          content: json["content"],
          sendername: json["sendername"],
          sinderid: json["sinderid"],
          roomid: json["roomid"],
        );

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "date": date,
      "content": content,
      "sendername": sendername,
      "sinderid": sinderid,
      "roomid": roomid,
    };
  }
}
