import 'package:ecommerse/utils/string_constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback onTap;
  final Color color;
  
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.white,
    this.width = 150,
   });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Color.fromARGB(153, 6, 70, 56),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 15),
           child: Center(
              child: Text(
            text,
            style: TextStyle(color: color,fontFamily: StringConstant.font),
          )))));
  }
}