import 'package:flutter/material.dart';
import 'package:scholar_chat/data/message_model.dart';
import 'package:scholar_chat/utils/colors.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.message,});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        padding: const EdgeInsets.all(16,),
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(32),
            topStart: Radius.circular(32),
            bottomEnd: Radius.circular(32),
          ),
        ),
        child: Text(
          message.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({Key? key, required this.message,});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        padding: const EdgeInsets.all(16,),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadiusDirectional.only(
            topEnd: Radius.circular(32),
            topStart: Radius.circular(32),
            bottomEnd: Radius.circular(32),
          ),
          border: Border.all(
            color: primaryColor,
          ),
        ),
        child: Text(
          message.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
