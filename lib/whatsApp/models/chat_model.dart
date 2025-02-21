import 'dart:convert';

class ChatModel {
  String? name ;
  String? message ;
  String? createdAt ;
  String? image;
  ChaType? messageType ;

  ChatModel({
    required this.name,
    required this.message,
    required this.createdAt,
    required this.image,
    required this.messageType,
  });

  ChatModel.fromJson(Map json){
    name = json["name"];
    message = json["message"];
    createdAt = json["createdAt"];
    image = json["image"];
    if (json["messageType"] == "message"){
      messageType =ChaType.MESSAGE;
    } else if (json["messageType"] == "video"){
      messageType =ChaType.VIDEO;
    } else{
      messageType =ChaType.GIF;
    }

  }
}

enum ChaType{
  MESSAGE,
  VIDEO,
  GIF,
}