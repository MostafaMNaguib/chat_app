import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({Key? key,this.onTap,required this.text});

  void Function()? onTap;
  String text;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,color: Color(0xFF2B475E),
          ),
        ),
      ),
    );
  }
}
