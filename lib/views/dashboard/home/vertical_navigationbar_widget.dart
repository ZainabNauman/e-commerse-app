import 'package:ecommerse/utils/media_query.dart';
import 'package:ecommerse/utils/string_constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VerticalNavigationBar extends StatefulWidget {
  int currentIndex;
  Function(int) changeIndex;
  VerticalNavigationBar({super.key, required this.currentIndex,required this.changeIndex});

  @override
  _VerticalNavigationBarState createState() => _VerticalNavigationBarState();
}

class _VerticalNavigationBarState
    extends State<VerticalNavigationBar> {

  @override
  Widget build(BuildContext context) {
    double width=displayWidth(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(20,10,20,10),
      padding: EdgeInsets.fromLTRB(width*0.01, width*0.04, width*0.01, width*0.04),
      decoration:BoxDecoration(color: const Color.fromARGB(153, 160, 174, 171), borderRadius: BorderRadius.circular(60)),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              widget.changeIndex(0);
            },
            child: Column(mainAxisSize: MainAxisSize.min,children: [
              Icon(Icons.person,
                size: widget.currentIndex == 0 ? width * 0.019: width*0.017,
                color:widget.currentIndex == 0 ?Colors.black : Colors.grey),
              Text("Profile",
                style: TextStyle(
                  fontFamily: StringConstant.font,
                  fontSize:widget.currentIndex == 0 ? width * 0.01:  width*0.008,
                  color:widget.currentIndex == 0 ?Colors.black : Colors.grey))])),
          GestureDetector(
            onTap: (){
              widget.changeIndex(1);
            },
            child: Column(mainAxisSize: MainAxisSize.min,children: [
              Icon(Icons.home,
                size: widget.currentIndex == 1 ? width * 0.019: width*0.017,
                color:widget.currentIndex == 1 ?Colors.black : Colors.grey),
              Text("Home",
                style: TextStyle(
                  fontFamily: StringConstant.font,
                  fontSize:widget.currentIndex == 1 ? width * 0.01:  width*0.008,
                  color:widget.currentIndex == 1 ?Colors.black : Colors.grey))])),
          GestureDetector(
            onTap: (){
              widget.changeIndex(2);
            },
            child: Column(mainAxisSize: MainAxisSize.min,children: [
            Icon(Icons.history,
              size: widget.currentIndex == 2 ? width * 0.019: width*0.017,
              color:widget.currentIndex == 2 ?Colors.black : Colors.grey),
            Text("History",
              style: TextStyle(
                fontFamily: StringConstant.font,
                fontSize:widget.currentIndex == 2 ? width * 0.01:  width*0.008,
                color:widget.currentIndex == 2 ?Colors.black : Colors.grey))]))]));
  }
}

