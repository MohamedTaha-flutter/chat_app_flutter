import 'package:chat_app/model/message_model.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';


class ChatBubbleWidget extends StatelessWidget {

  final MessageModel message;

  const ChatBubbleWidget({super.key, required this.message});



  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message.message,
      color:  Color(0xFF1B97F3) ,
      tail: true,
      isSender:true  ,
      textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16
      ),
    );
  }
}


