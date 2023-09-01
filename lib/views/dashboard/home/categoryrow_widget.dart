import 'package:ecommerse/models/category_model.dart';
import 'package:ecommerse/utils/helper_function.dart';
import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  final List<CategoryModel> categories;
  //final List<String> name=ImageConstant.names;
  final void Function(int) onCategoryTapped;

  CategoryRow(this.categories, {super.key,required this.onCategoryTapped});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Size size =responseMediaQuery(context);
    return Container(
      color: Colors.transparent,
      height: size.width*0.24,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              onCategoryTapped(index);
            },
            child: Container(
              margin: EdgeInsets.only(left:size.width*0.03,right:size.width*0.03,top:size.width*0.01),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.transparent),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        categories[index].imageUrl,
                        height: responseSize(screenWidth * 0.15, context),
                      )),
                    SizedBox(height: screenWidth*0.012),
                    Text(categories[index].title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14),
                      textAlign: TextAlign.center, 
            )]))));
        }));
  }
}
