import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/utils/colors.dart';
import 'package:scholar_chat/utils/constants.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key,}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2,),
            Image.asset(logo),
            const Text(
              "Scholar Chat",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,color: Colors.white,fontFamily: 'pacifico',

              ),
            ),
            const Spacer(flex: 2,),
            const Row(
              children: [
                Text(
                  "REGISTER",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            CustomTextField(
              onChanged: (val){
                email = val;
              },
              hintText: "Enter Email",
            ),
            const SizedBox(height: 10,),
            CustomTextField(
              onChanged: (val){
                password = val;
              },
              hintText: "Password",
            ),
            const SizedBox(height: 20,),
            CustomButton(
              onTap: () async {
                try{
                  await registerUser();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(email: email,)));
                } on FirebaseAuthException catch(ex){
                  debugPrint("${ex.email}");
                  if(ex.code == 'weak-password'){
                    showSnackBar(context, "weak-password");
                  }else if(ex.code == 'email-already-in-use'){
                    showSnackBar(context, "email-already-in-use");
                  }else{
                    showSnackBar(context, " ${ex.message}");
                  }
                }
              },
              text: "REGISTER",
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account ?",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "  Login  ",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,color: Color(0xFFC7EDE6),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }

  Future<void> registerUser() async{
    UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    debugPrint(" ss ${user.user?.email}");
  }
  void showSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }


}
