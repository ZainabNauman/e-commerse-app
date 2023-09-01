import 'package:ecommerse/utils/helper_function.dart';
import 'package:ecommerse/utils/responsive_class.dart';
import 'package:ecommerse/utils/string_constant.dart';
import 'package:ecommerse/views/dashboard/home/ratingbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../models/item_model.dart';
import 'itemDetail/itemdetail_desktopscreen.dart';
import 'itemDetail/itemdetail_screen.dart';

class ItemGridView extends StatefulWidget {
  final List<ItemModel> items;
  const ItemGridView(this.items, {super.key}); 
  @override
  State<ItemGridView> createState() => _ItemGridViewState();
}

class _ItemGridViewState extends State<ItemGridView> {
  @override
  Widget build(BuildContext context) {  
    Size size = responseMediaQuery(context);
    return 
    Padding(
      padding: EdgeInsets.only(left:size.width*0.05,right:size.width*0.05),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 
          Responsive.isMobile(context)?2
          :Responsive.isTablet(context)?2
          :3,
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int index) => Card(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return Responsive.isMobile(context) 
                      ?IndividualItem(item:widget.items[index])
                      :IndividualItemDesktop(item:widget.items[index]);
                  }));
              },
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: Image.network(widget.items[index].img)),
                    const Divider(height:1,color: Colors.black,indent: 5,endIndent: 5,thickness: 0.08),
                    Padding(
                      padding: EdgeInsets.only(top: size.width*0.01,left: size.width*0.05,right:size.width*0.05,bottom:size.width*0.002),
                      child: Text(widget.items[index].name,style: TextStyle(fontFamily: StringConstant.font))),
                    Padding(
                      padding: EdgeInsets.only(top: size.width*0.01,left: size.width*0.05,right:size.width*0.05,bottom:size.width*0.002),
                      child: Row(
                        children: [
                          RatingBarWidget(),
                          SizedBox(width: size.width*0.007),
                          Text("(0 Reviews)",style: TextStyle(fontFamily: StringConstant.font,fontSize: size.width*0.025))
                        ])),
                    Padding(
                      padding: EdgeInsets.only(left: size.width*0.05,right:size.width*0.05,bottom:size.width*0.01),
                      child: Row(
                        children: [
                          Expanded(child: Text(widget.items[index].price,style: TextStyle(fontFamily: StringConstant.font))),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return Responsive.isMobile(context)? IndividualItem(item:widget.items[index]):IndividualItemDesktop(item:widget.items[index]);
                                }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(153, 160, 174, 171),
                                borderRadius: BorderRadius.circular(20)),
                                child: const Padding(padding: EdgeInsets.all(6.0),
                                  child: Icon(Icons.shopping_cart_outlined),
                              )))]))])))),
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,    
      ));
  }
}