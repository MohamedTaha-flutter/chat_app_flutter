class MessageModel {
  final String message ;

  MessageModel(this.message);
  factory MessageModel.fromJson(json)
  {
    return MessageModel(
      json["message"]
    );
  }
}