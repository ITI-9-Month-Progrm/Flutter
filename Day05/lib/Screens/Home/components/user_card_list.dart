import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lab05/Models/user.dart';

class UserCardItem extends StatelessWidget {
  final User user;
  final Function press;

  UserCardItem({
    this.user,
    this.press,
  });
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:press ,
      child:  Container(
        //alignment: Alignment.center,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(0.6),
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(padding: EdgeInsets.all( 20),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.image),

                ),),

              Text(user.name,style: TextStyle(fontSize: 20),)

            ],
          )
      ),
    );
  }
}
