import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revision_1/const.dart';
import 'package:flutter_revision_1/json_files/chats_json.dart';
import 'package:flutter_revision_1/whatsApp/widgets/custom_chats.dart';
import 'models/chat_model.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text("WhatsApp")),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(CupertinoIcons.chat_bubble_text_fill),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomChats(icon: Icons.lock, text: "Locked Chats"),
              SizedBox(height: 20),
              CustomChats(
                  icon: Icons.lock, text: "Archived", countMessages: "50"),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: names.length,
                itemBuilder: (context, index) =>
                    _chatItem(
                      name: names[index].name ?? "",
                      message: names[index].message ?? "",
                      createdAt: names[index].createdAt ?? "",
                      image: names[index].image ?? "",
                      messageType: names[index].messageType!,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chatItem({
    required String name,
    required String message,
    required String createdAt,
    required String image,
    required ChaType messageType,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _messageTypeBuilder(message,messageType),
              ],
            ),
            Spacer(),
            Text(createdAt, style: TextStyle(color: Colors.grey)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _messageTypeBuilder(String message, ChaType messageType) {
    if (messageType == ChaType.MESSAGE) {
      return Row(
        children: [
          Icon(Icons.done_all_rounded,color: Colors.blue,),
          Text(
            message,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else if (messageType == ChaType.VIDEO) {
      return Row(
        children: [
          Icon(CupertinoIcons.video_camera_solid, color: Colors.grey),
          Text("Video",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              )),
        ],
      );
    }else {
      return Row(
        children: [
          Icon(Icons.gif, color: Colors.grey),
          Text("GIF",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              )),
        ],
      );
    }
  }

  List<ChatModel> names = whatsAppChats.map((e) => ChatModel.fromJson(e)).toList();
}

//it could be Method or Class
// Widget _customChats({
//   required IconData icon ,
//   required String text,
//   String? countMessages
//   }){
//   return Row(
//     children: [
//       Icon(icon ,
//         color: Colors.green,),
//       SizedBox(width: 20,),
//       Text(text,style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold
//       ),),
//       if(countMessages != null) Spacer(),
//       if(countMessages != null)
//       Text(countMessages,style: TextStyle(
//           color: Colors.green,
//           fontSize: 14,
//           fontWeight: FontWeight.bold
//       ),),
//
//     ],
//   );
// }
