import 'package:flutter/material.dart';
import 'package:scholar_chat/utils/colors.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key,}) : super(key: key);

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
        child: const Text(
          "I'm a new user",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
