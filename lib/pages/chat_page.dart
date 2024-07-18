import 'package:flutter/material.dart';
import 'package:scholar_chat/utils/chat_bubble.dart';
import 'package:scholar_chat/utils/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      centerTitle: true,
      backgroundColor: primaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/scholar.png",height: 50,),
          const Text(
            "Chat",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,color: Colors.white,fontFamily: 'pacifico',

            ),
          ),
        ],
      ),
    );
  }

  List<String> messages = [];
  String message = "";

  Widget _buildBody(){
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context,index){
              return const ChatBubble();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onChanged: (val){
              message = val;
            },
            decoration: InputDecoration(
              hintText: "Send Message",
              hintStyle: const TextStyle(

              ),
              suffixIcon: InkWell(
                onTap: (){
                  messages.add(message);
                  setState(() {});
                },
                child: const Icon(
                  Icons.send,
                  color: primaryColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),

            ),
          ),
        ),
      ],
    );
  }

}
