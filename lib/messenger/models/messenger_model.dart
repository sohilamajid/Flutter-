
class MessengerModel{
  String? name;
  String? image;
  String? message;
  IconType? icon;

  MessengerModel({
    required this.name,
    required this.image,
    required this.message,
    required this.icon,
  });

  MessengerModel.fromJson(Map json){
    name = json["name"];
    image = json["image"];
    message = json["message"];
    if (json["icon"] == "received"){
      icon = IconType.CHECK_ICON;
    } else if (json["icon"] == "read"){
      icon = IconType.PICTURE_IMAGE;
    } else{
      icon = IconType.CIRCLE_AVATAR;
    }
  }

}

enum IconType {
  CHECK_ICON,
  CIRCLE_AVATAR,
  PICTURE_IMAGE,
}