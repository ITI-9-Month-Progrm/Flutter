import 'package:flutter/material.dart';
import 'package:lab03tasks/DefaultColors.dart';
import 'package:lab03tasks/Screen/Home/home_screen.dart';
import 'package:lab03tasks/Screen/Details/details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      //  primarySwatch: Colors.blue,
      textTheme: Theme.of(context).textTheme.apply(bodyColor:kTextColor)
      ),
     // home: BagListView(),
      initialRoute: '/',
      routes: {
        BagListView.routeName:(context)=>BagListView(),
        DetailsView.routeName:(context)=>DetailsView(),

      },
    );
  }
}
