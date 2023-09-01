import 'package:ecommerse/utils/helper_function.dart';
import 'package:ecommerse/utils/string_constant.dart';
import 'package:ecommerse/views/dashboard/history/orderdetail_page.dart';
import 'package:flutter/material.dart';

import '../../../models/order_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=responseMediaQuery(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Order History',style:TextStyle(color: Colors.black,fontFamily: StringConstant.font,fontWeight: FontWeight.bold,fontSize: size.width *0.05)),
      ),
      body: Container(
        color: const Color.fromARGB(255, 159, 185, 182).withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.only(top: size.width*0.03),
          child: ListView.builder(
            itemCount: mockOrders.length,
            itemBuilder: (context, index) {
              final order = mockOrders[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  OrderDetailPage(order: order)));  
                },
                child: Column(children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: size.width*0.07),
                    child: Container(
                      decoration: BoxDecoration(color: const Color.fromARGB(255, 159, 185, 182),borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black)),
                      width: double.infinity,
                      child: Padding(padding:  EdgeInsets.all(size.width*0.04),
                        child: Row(
                          children: [
                            Container(decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.all(size.width*0.02),
                              child: Text((index+1).toString(),style: const TextStyle(color: Colors.white),),
                            )),
                            SizedBox(width: size.width*0.05,),
                            Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order #${order.orderNumber}',style: TextStyle(fontFamily: StringConstant.font),),
                                Text('Total: \$${order.totalAmount.toStringAsFixed(2)}',style: TextStyle(fontFamily: StringConstant.font),),
                                Text('Date: ${order.orderDate.day}/${order.orderDate.month}/${order.orderDate.year}',style: TextStyle(fontFamily: StringConstant.font)),
                              ]),
                          ],
                        )))),
                  Divider(thickness: size.width*0.001,color: Colors.grey,indent: size.width*0.08,endIndent: size.width*0.08)
                ]));
            }))));            
  }
}
      
   
