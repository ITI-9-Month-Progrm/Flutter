import 'package:flutter/material.dart';
import 'package:lab05/Screens/Home/home_screen.dart';
import 'package:lab05/Screens/Details/details_screen.dart';
import 'package:lab05/Screens/CreateUser/create_user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomeView(),
      initialRoute: '/',
      routes: {
        HomeView.routeName:(context)=>HomeView(),
        DetailsScreen.routeName:(context)=>DetailsScreen(),
        CreateUserScreen.routeName:(context)=>CreateUserScreen(),
      },
    );
  }
}

