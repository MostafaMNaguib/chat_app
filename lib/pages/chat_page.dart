import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/data/message_model.dart';
import 'package:scholar_chat/utils/chat_bubble.dart';
import 'package:scholar_chat/utils/colors.dart';
import 'package:scholar_chat/utils/constants.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.email, }) : super(key: key);

  final String email;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  CollectionReference fireStore =  FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: fireStore.orderBy('createdAt').snapshots(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          List<MessageModel> messagesList = [];
          for(int i = 0;i < snapshot.data!.docs.length; i++){
            messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: _buildAppBar(),
            body: _buildBody(messagesList),
          );
        }else{
          return const Scaffold(
            body: Center(
              child: Text(
                  "Loading"
              ),
            ),
          );
        }
      },
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

  Widget _buildBody(List<MessageModel> messages){
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _controller,
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context,index){
              return messages[index].id == widget.email ?
              ChatBubble(message: messages[index],) :
              ChatBubbleForFriend(message: messages[index]);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: controller,
            onChanged: (val){
              message = val;
            },
            decoration: InputDecoration(
              hintText: "Send Message",
              hintStyle: const TextStyle(

              ),
              suffixIcon: InkWell(
                onTap: () async{
                  // messages.add(message);
                  await fireStore.add({
                    "message" : message,
                    "user" : "user1",
                    "id" : widget.email,
                    "createdAt": DateTime.now(),
                  });
                  controller.clear();
                  _controller.animateTo(
                      _controller.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 10),
                      curve: Curves.fastOutSlowIn
                  );
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
