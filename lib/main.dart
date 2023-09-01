import 'package:ecommerse/provider/mobile_provider.dart';
import 'package:ecommerse/views/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
 runApp(MultiProvider(providers: [
    ChangeNotifierProvider<MobileLayoutProvider>(
        create: (context) => MobileLayoutProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
      
    );
  }
}
