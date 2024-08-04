class MessageModel{

  final String text;
  final String id;
  final String date;

  MessageModel(this.text, this.id, this.date);

  factory MessageModel.fromJson(json) =>
      MessageModel(json["message"],json["id"],"");

}