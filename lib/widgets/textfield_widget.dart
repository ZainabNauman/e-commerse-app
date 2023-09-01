import 'package:flutter/material.dart';
import '../utils/media_query.dart';
import '../utils/string_constant.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget{
  TextEditingController controller=TextEditingController();
   CustomTextField({super.key, required this.controller});
  
  @override
  Widget build(BuildContext context) {
    double width=displayWidth(context);
    return TextField(
    
      controller: controller,
      cursorColor: Colors.white,
      decoration: InputDecoration(
      hintText: StringConstant.searchString,
      hintStyle:  TextStyle(fontFamily: StringConstant.font,color: Colors.black),
      suffixIcon: IconButton(
        splashRadius: width*0.03,
        icon: const Icon(Icons.clear,color: Colors.black,),
        onPressed: () => controller.clear()),
      prefixIcon: IconButton(
        splashRadius: width*0.03,
        icon: const Icon(Icons.search,color:Colors.black),
        onPressed: () {}),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15.0)))); 
  }  
}

