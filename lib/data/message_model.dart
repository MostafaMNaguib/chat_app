class MessageModel{

  final String text;

  MessageModel(this.text);

  factory MessageModel.fromJson(json) =>
      MessageModel(json["message"]);

}