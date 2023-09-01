import 'package:ecommerse/utils/helper_function.dart';
import 'package:flutter/material.dart';

class ShoppingCounter extends StatefulWidget{
  const ShoppingCounter({super.key});

  @override
  State<ShoppingCounter> createState() => _ShoppingCounterState();
}

class _ShoppingCounterState extends State<ShoppingCounter> {

  List numberOfItems = [];
  void addItems() {
    numberOfItems.add(0);
    numberOfItems.add(1);
    numberOfItems.add(2);
    numberOfItems.add(3);
    numberOfItems.add(4);
    numberOfItems.add(5);
  }

  @override
  void initState() {
    super.initState();
    addItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child:_shoppingItem(0));
  }
  
  Widget _shoppingItem(int itemIndex) {
    Size size=responseMediaQuery(context);
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[      
          _decrementButton(itemIndex),
          SizedBox(width: size.width*0.03),
          Text(
            '${numberOfItems[itemIndex]}',
            style:  TextStyle(fontSize: size.width*0.04),
          ),
          SizedBox(width: size.width*0.03),
          _incrementButton(itemIndex)]));
  }

  Widget _incrementButton(int index) {
    Size size=responseMediaQuery(context);
    return InkWell(
      onTap: () {
        setState(() {
            numberOfItems[index]++;
          });
      },
      child: Container(
        decoration: BoxDecoration(color: const Color.fromARGB(153, 160, 174, 171),borderRadius: BorderRadius.circular(8)),
        
        child:  Padding(
          padding: EdgeInsets.all(size.width*0.01),
          child: const Icon(Icons.add, color: Colors.black),
        )));
  }

  Widget _decrementButton(int index) {
    Size size=responseMediaQuery(context);
    return InkWell(
      onTap: () {
        setState(() {
          numberOfItems[index]--;
        });
      },
      child: Container(   
        decoration: BoxDecoration(color: const Color.fromARGB(153, 160, 174, 171),borderRadius: BorderRadius.circular(8)),
          child:  Padding(
            padding: EdgeInsets.all(size.width*0.01),
            child: const Icon(Icons.remove, color: Colors.black))),
    );
  }

}
