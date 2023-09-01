
import 'package:ecommerse/utils/responsive_class.dart';
import 'package:flutter/material.dart';

 responseSize (double value,BuildContext context){
   return Responsive.isMobile(context) ?value
   :Responsive.isTablet(context) ?value/2
   :value/3;
  }
  responseSizeforImageRow (double value,BuildContext context){
   return Responsive.isMobile(context) ?value
   :Responsive.isTablet(context) ?value/1.5
   :value/2;
  }

  responseMediaQuery (BuildContext context){
   return Responsive.isMobile(context) ?MediaQuery.of(context).size
   :Responsive.isTablet(context) ?MediaQuery.of(context).size/2
   :MediaQuery.of(context).size/3;
  }