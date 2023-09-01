import 'package:ecommerse/utils/helper_function.dart';
import 'package:ecommerse/utils/string_constant.dart';
import 'package:ecommerse/views/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
 
  @override
  Widget build(BuildContext context) {
    Size size =responseMediaQuery(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromARGB(153, 160, 174, 171),
          child:  AnimatedSplashScreen(
            splash: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(decoration: const BoxDecoration(color: Colors.black,shape: BoxShape.circle),child: Padding(
                  padding: EdgeInsets.all(size.width*0.02),
                  child: Icon(Icons.chair,size: size.width*0.2,color: const Color.fromARGB(153, 160, 174, 171)),
                )),
              Stack(children: [
                Text("House Fittings",
                  style: TextStyle(   
                    fontFamily: StringConstant.font,
                    fontSize: size.width*0.1,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 10
                      ..color = Colors.black,
                  ),
                ),
                Text("House Fittings",
                  style: TextStyle(
                    color: const Color.fromARGB(153, 160, 174, 171),
                    letterSpacing: 5,
                    fontFamily: StringConstant.font,
                    fontSize: size.width*0.1,
                    fontWeight: FontWeight.bold,
                  ))])]),
          backgroundColor: const Color.fromARGB(153, 160, 174, 171),
          nextScreen: const DashboardScreen(),
          splashIconSize: 250,
          duration: 5,
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
          animationDuration: const Duration(seconds: 1),
        ))));
  }
}
  
