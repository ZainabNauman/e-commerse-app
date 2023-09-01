import 'package:ecommerse/models/item_model.dart';
import 'package:ecommerse/utils/helper_function.dart';
import 'package:ecommerse/utils/string_constant.dart';
import 'package:ecommerse/views/dashboard/home/itemDetail/itemcounter.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_button.dart';
import '../ratingbar.dart';

// ignore: must_be_immutable
class IndividualItemDesktop extends StatelessWidget{ 
  ItemModel item;
  IndividualItemDesktop({super.key,required this.item});
  
  @override
  Widget build(BuildContext context) {
    Size size = responseMediaQuery(context);
    return Scaffold(appBar: AppBar(        
      title: Text('Order Details',style:TextStyle(color: Colors.black,fontFamily: StringConstant.font,fontWeight: FontWeight.bold,fontSize: size.width *0.05)),
      backgroundColor: Colors.white,elevation: 0,iconTheme: const IconThemeData(color: Colors.black),),
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
          image: DecorationImage(
            image:NetworkImage(item.img),
            fit: BoxFit.fill)))),
          Expanded(
            flex: 5,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.width*0.08,left:size.width*0.04,bottom: size.width*0.01),
                  child: Text(item.name,style: TextStyle(fontSize:size.width*0.05 ,fontFamily:StringConstant.font,fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(left:size.width*0.04,bottom: size.width*0.01,right: size.width*0.02),
                  child: Row(children: [
                    Text(item.price,style: TextStyle(fontSize: size.width*0.055 ,fontFamily:StringConstant.font,fontWeight: FontWeight.bold)),
                    Expanded(child: SizedBox(width: size.width*0.4)),
                    const ShoppingCounter()])),
                Padding(padding:  EdgeInsets.only(left:size.width*0.04,bottom: size.width*0.02),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBarWidget(),
                      SizedBox(width: size.width*0.005,),
                      Text("(0 Reviews)",style: TextStyle(fontFamily: StringConstant.font,fontSize: size.width*0.03))])),
                      Padding(
                  padding: EdgeInsets.only(left: size.width*0.04,bottom: size.width*0.02),
                  child: Text("Description",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width*0.05 ,fontFamily:StringConstant.font,fontWeight: FontWeight.bold))),
                    Padding(
                      padding: EdgeInsets.only(left: size.width*0.04,bottom: size.width*0.02),
                      child: Text(StringConstant.dummyString,style: TextStyle(fontSize: size.width*0.04 ,fontFamily:StringConstant.font,fontWeight: FontWeight.normal))),
                Padding(
                  padding: EdgeInsets.only(left:size.width*0.04,bottom: size.width*0.08,right: size.width*0.04,top: size.width*0.02),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(decoration: BoxDecoration(color: const Color.fromARGB(153, 160, 174, 171),borderRadius: BorderRadius.circular(8)),child: Padding(
                        padding:  EdgeInsets.all(size.width*0.01),
                        child: Icon(Icons.bookmark_border,size: size.width*0.07))),
                      SizedBox(width: size.width*0.02),
                      Expanded(child: CustomButton(color: Colors.white,text: 'ADD TO CART',onTap: () {}))]))]))]));  
  }
}