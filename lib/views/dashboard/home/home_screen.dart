import 'package:ecommerse/utils/helper_function.dart';
import 'package:ecommerse/utils/responsive_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/mobile_provider.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/string_constant.dart';
import 'categoryrow_widget.dart';
import 'item_gridview.dart';
import '../../../widgets/textfield_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  int count=0;
  @override
  Widget build(BuildContext context) {
    Size size =responseMediaQuery(context);
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => MobileLayoutProvider(),
        child: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title:  Text(StringConstant.titleString,style: TextStyle(color: ColorConstant.black,fontWeight: FontWeight.bold,fontSize: size.width *0.05 ,fontFamily: StringConstant.font),),
          actions:  [
            if(!Responsive.isMobile(context)) Padding(
              padding:  EdgeInsets.all(size.width*0.002),
              child: Container(
                decoration: BoxDecoration(color: const Color.fromARGB(255, 226, 225, 225),borderRadius: BorderRadius.circular(15)),
                width: size.width*0.5,
                child: CustomTextField(
                  controller: searchController)),
            ),
            Padding(padding:  EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Icon(
              Icons.shopping_cart,color: ColorConstant.black,size: size.width*0.07),
          )]),
        body: Column(
           children: [
          Padding(
              padding:  EdgeInsets.symmetric(horizontal: size.width*0.02),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                if(Responsive.isMobile(context)) Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: const Color.fromARGB(255, 226, 225, 225),borderRadius: BorderRadius.circular(15)),
                      width: size.width*0.3,
                      child: CustomTextField(
                        controller: searchController,
                        ))),
                  SizedBox(width: size.width*0.01)]),
            ),
                CategoryRow(ImageConstant.categories,onCategoryTapped: handleCategoryTapped),
                Expanded(child: ItemGridView(
                  count==0?ImageConstant.items
                  :count==1?ImageConstant.bedList
                  :count==2?ImageConstant.chairsList
                  :count==3?ImageConstant.singlesofaList
                  :count==4?ImageConstant.tableList
                  :count==5?ImageConstant.sofasetList
                  :count==6?ImageConstant.studyTableList
                  :ImageConstant.bookShelfList,
                ))]))));
  }         
  void handleCategoryTapped(int index) {
    setState(() {
      count=index;
    });
  }
}
