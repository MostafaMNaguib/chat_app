import 'package:flutter/material.dart';
import 'package:scholar_chat/pages/register_page.dart';
import 'package:scholar_chat/utils/colors.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key,}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            Image.asset("assets/images/scholar.png"),
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
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            CustomTextField(
              hintText: "Enter Email",
            ),
            const SizedBox(height: 10,),
            CustomTextField(
              hintText: "Password",
            ),
            const SizedBox(height: 20,),
            CustomButton(text: "LOGIN",),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account ?",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterPage()));
                  },
                  child: const Text(
                    "  Register  ",
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
}
