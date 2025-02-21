import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,//to delete the line between appBar and body
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 8),
          child: CircleAvatar(backgroundImage: AssetImage("assets/images/avatar1.jpg"),),

        ),
        title: Text(
          "Chats",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 25,
        ),),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(.15),
              child: Icon(CupertinoIcons.camera_fill,color: Colors.black)),
          SizedBox(width: 10,),
          CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(.15),
              child: Icon(Icons.edit,color: Colors.black)),
          SizedBox(width: 10,),

        ],
      ),
    );
  }
}
