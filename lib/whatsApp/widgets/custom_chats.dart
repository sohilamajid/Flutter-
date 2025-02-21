
import 'package:flutter/material.dart';

class CustomChats extends StatelessWidget {
  final IconData icon ;
  final String text;
  final String? countMessages;
  const CustomChats({super.key,
    required this.icon,
    required this.text,
    this.countMessages});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon ,
          color: Colors.green,),
        SizedBox(width: 20,),
        Text(text,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),),
        if(countMessages != null) Spacer(),
        if(countMessages != null)
          Text(countMessages!,style: TextStyle(
              color: Colors.green,
              fontSize: 14,
              fontWeight: FontWeight.bold
          ),),

      ],
    );
  }
}
