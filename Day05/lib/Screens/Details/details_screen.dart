import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:lab05/Models/user.dart';
import 'package:lab05/Screens/Details/detailsArgs.dart';

class DetailsScreen extends StatelessWidget {
  static final routeName = '/userDetails';
  final User user;

  DetailsScreen({this.user});

  @override
  Widget build(BuildContext context) {

    final ScreenArguments args =
    ModalRoute.of(context).settings.arguments as ScreenArguments;

    return Scaffold(

      body:Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(args.user.image),
                fit: BoxFit.cover,
              ),
            ),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: new Container(
                decoration: new BoxDecoration(color: Colors.white.withOpacity(0.1)),

              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 100,top: 50,right: 100),
          child: Container(
            width: 300,
            height: 300,
            child:  CircleAvatar(
              backgroundImage: NetworkImage(args.user.image),

            ),
          ),),
          Padding(padding: EdgeInsets.only(left: 150,top: 350,right: 0),
            child: Container(

              child:Text(args.user.name,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
            ),),
          Padding(padding: EdgeInsets.only(left: 150,top: 450,right: 0),
            child: Container(

              child:Text(args.user.email,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            ),),

        ],
      )

    );
  }
}
