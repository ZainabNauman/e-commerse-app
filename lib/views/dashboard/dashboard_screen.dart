import 'package:ecommerse/utils/responsive_class.dart';
import 'package:ecommerse/views/dashboard/history/orderlist_history_page.dart';
import 'package:ecommerse/views/dashboard/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/helper_function.dart';
import '../../utils/media_query.dart';
import 'profile/profile_page.dart';
import 'home/vertical_navigationbar_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  
  int _currentIndex = 1;
  final List<Widget> _children = [
    const ProfilePage(),
    const HomeScreen(),
    HistoryPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width=displayWidth(context);
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Responsive.isMobile(context) ? _children[_currentIndex]   
      :Responsive.isTablet(context) 
      ?Row(children: [
        Expanded(flex: 2,child: VerticalNavigationBar(currentIndex: _currentIndex, changeIndex: (val){
          onTabTapped(val);
        },)), 
        Expanded(flex: 8,child: _children[_currentIndex])])
      :Row(children: [
        Expanded(flex:1,child: Container()),
        Expanded(flex: 1,child: VerticalNavigationBar(currentIndex: _currentIndex, changeIndex: (val){
          onTabTapped(val);
        })), 
        
      Expanded(flex: 6,child: _children[_currentIndex]),
      Expanded(flex:1,child: Container()),
      ]),
      
      
    bottomNavigationBar: Responsive.isMobile(context)?  Padding(
      padding: EdgeInsets.only(left: width*0.01,right:width*0.01,bottom: width*0.01),
      child: ClipRRect(
        borderRadius:BorderRadius.circular(40),
        child: BottomNavigationBar(                
                  backgroundColor: const Color.fromARGB(153, 160, 174, 171),
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.history),
                        label: 'History',  
                      )],
                    currentIndex: _currentIndex,
                    selectedItemColor: Colors.black,
                    selectedIconTheme:IconThemeData(
                      size: responseSize(width*0.06, context) 
                    ),
                    onTap: (index){
                      onTabTapped(index);
                    },
                  ),
      ),
    ): null,)
    ;
  }
}
