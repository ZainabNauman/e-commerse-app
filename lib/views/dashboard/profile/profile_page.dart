import 'package:ecommerse/utils/helper_function.dart';
import 'package:ecommerse/utils/string_constant.dart';
import 'package:flutter/material.dart';

import '../../../models/profilemodel.dart';
import '../../../utils/responsive_class.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
 
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Size size=responseMediaQuery(context);
    return 
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title:  Text(
          'Profile',
          style: TextStyle(color: Colors.black,fontFamily: StringConstant.font,fontWeight: FontWeight.bold,fontSize: size.width *0.05),
        ),
      ),
      body: Center(
        child: Row(
          children: [       
            Expanded(
              flex: Responsive.isDesktop(context) ?8:10,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(size.width*0.02),
                  child: Container(
                    width: screenWidth * 0.8,
                    padding: EdgeInsets.all(size.width*0.04),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 159, 185, 182).withOpacity(0.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width*0.2,
                          backgroundImage: const NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpsyhK5TwUbzY2AtlUeJIctBoxFTCQt6vrkQ&usqp=CAU"),
                          ),
                        SizedBox(height: size.width*0.01),
                        Text('Zainab Nauman',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: StringConstant.font
                          )),
                        SizedBox(height: size.width*0.01),
                        Text('zainabnauman1992@gmail.com',
                          style: TextStyle(
                            fontSize: size.width*0.04,
                            color: Colors.black,
                            fontFamily: StringConstant.font
                          ),
                        ),
                        SizedBox(height: size.width*0.01),
                        Wrap(
                          children: [IntrinsicHeight(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text(
                              '03428573798',
                              style: TextStyle(
                                fontSize: size.width*0.04,
                                color: Colors.black,
                                fontFamily: StringConstant.font
                              )),
                              VerticalDivider(thickness: size.width*0.001,color: Colors.black,),
                               Wrap(
                                 children: [Text(
                                  'Changa Road Daska, Sialkot',
                                   style: TextStyle(
                                  fontSize: size.width*0.04,
                                  color: Colors.black,
                                  fontFamily: StringConstant.font)),
                           ] )])),
                      ]),
                        Padding(padding: EdgeInsets.fromLTRB(size.width*0.01,size.width*0.03,size.width*0.01,size.width*0.025),
                          child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black),color: const Color.fromARGB(255, 159, 185, 182),borderRadius: BorderRadius.circular(15)),
                            width: size.width*0.9,
                            child: Padding(padding:  EdgeInsets.only(left:size.width*0.11,right:size.width*0.11,top:size.width*0.1,bottom:size.width*0.1),
                              child:  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(children: [
                                    Icon(Icons.book,size: size.width*0.06),
                                    SizedBox(width: size.width*0.01),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("20",style: TextStyle(fontFamily: StringConstant.font,fontWeight: FontWeight.bold)),
                                        Text("Orders",style: TextStyle(fontFamily: StringConstant.font,fontWeight: FontWeight.bold))
                                      ])]),
                                  Row(children: [
                                   Icon(Icons.credit_card_sharp,size: size.width*0.06),
                                SizedBox(width: size.width*0.01,),
                                 Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text("\$100",style: TextStyle(fontFamily: StringConstant.font,fontWeight: FontWeight.bold)),
                                  Text("Balance",style: TextStyle(fontFamily: StringConstant.font,fontWeight: FontWeight.bold))
                                  ])])])))),
                                  Divider(thickness: size.width*0.003,color: Colors.grey,indent: size.width*0.01,endIndent:size.width*0.01,),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: profileData.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.all(size.width * 0.03),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 159, 185, 182),
                                            borderRadius: BorderRadius.circular(5),
                                            boxShadow:  [
                                              const BoxShadow(offset: Offset(5,5),color: Color.fromARGB(255, 54, 54, 54),spreadRadius: 1,blurRadius: 10),
                                              BoxShadow(offset: const Offset(-5,-5),color: const Color.fromARGB(255, 175, 194, 191).withOpacity(0.4),spreadRadius: 1,blurRadius: 10),
                                            ]),
                                          width: size.width * 0.9,
                                          child: Padding(
                                            padding: EdgeInsets.all(size.width * 0.05),
                                            child: Row(
                                              children: [
                                                profileData[index].icon,
                                                SizedBox(width: size.width*0.03),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(profileData[index].title,
                                                      style: TextStyle(
                                                        fontFamily: StringConstant.font,
                                                        fontWeight: FontWeight.w500,
                                                      )),
                                                      SizedBox(height: size.width*0.01),
                                                    Text(
                                                      profileData[index].value,
                                                      style: TextStyle(
                                                        fontFamily: StringConstant.font,
                                                        fontWeight: FontWeight.bold))]),
                                              ],
                                            ))));
                      })])),
                )))])));
  }
}

