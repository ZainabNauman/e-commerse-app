import 'package:ecommerse/utils/helper_function.dart';
import 'package:ecommerse/utils/responsive_class.dart';
import 'package:flutter/material.dart';

import '../../../models/order_model.dart';
import '../../../utils/string_constant.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;
  const OrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    Size size = responseMediaQuery(context);
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 159, 185, 182).withOpacity(01),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Order Details',style:TextStyle(color: Colors.black,fontFamily: StringConstant.font,fontWeight: FontWeight.bold,fontSize: size.width *0.05)),
      ),
      body: Row(
        children: [
          if (!Responsive.isMobile(context))Expanded(flex: 2,child: Container()),
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(size.width*0.03),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(255, 159, 185, 182).withOpacity(01)),
                  child: Padding(
                    padding: EdgeInsets.all(size.width*0.05),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order #${order.orderNumber}',style: TextStyle(fontFamily: StringConstant.font,fontWeight: FontWeight.bold,fontSize: size.width*0.04)),
                        SizedBox(height: size.width*0.01,),
                        Text('Order Date: ${order.orderDate}',style: TextStyle(fontFamily: StringConstant.font,fontWeight: FontWeight.bold,fontSize: size.width*0.04)),
                        SizedBox(height: size.width*0.07),
                        Container(
                          decoration: BoxDecoration(color: const Color.fromARGB(153, 160, 174, 171),borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.black)),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:EdgeInsets.fromLTRB(size.width*0.05, size.width*0.08, size.width*0.05, size.width*0.05),
                                child: Text('Order Items',style:TextStyle(fontSize: size.width*0.05,fontWeight: FontWeight.bold,fontFamily: StringConstant.font)),
                              ),
                              SizedBox(height: size.width*0.02),
                              Divider(thickness: size.width*0.001,color: Colors.grey),
                              SizedBox(height: size.width*0.02),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal:size.width*0.05),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Product",style:TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.bold,fontFamily: StringConstant.font)),
                                    Text("Price",style:TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.bold,fontFamily: StringConstant.font))
                                  ])),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: order.items.length,
                                itemBuilder: (context, index) {
                                  final item = order.items[index];
                                  return Column(
                                    children: [
                                     Divider(thickness: size.width*0.001,color: Colors.grey),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal:size.width*0.05),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                          Text(item.productName,style:TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.bold,fontFamily: StringConstant.font)),
                                          Text('\$${item.price.toStringAsFixed(2)}',style:TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.normal,fontFamily: StringConstant.font)),
                                        ]))]);
                                }),
                              Divider(thickness: size.width*0.001,color: Colors.grey),
                              Padding(
                                padding: EdgeInsets.all(size.width*0.05),
                                child: Row(
                                  children: [
                                    Expanded(child: Text("Total",style:TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.bold,fontFamily: StringConstant.font))),
                                    Text(order.totalAmount.toString(),style:TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.bold,fontFamily: StringConstant.font)),
                                  ]))]))]),
                  )),
              ))),
          if (!Responsive.isMobile(context))Expanded(flex:2,child: Container())
        ],
      ),
    );
  }
}
