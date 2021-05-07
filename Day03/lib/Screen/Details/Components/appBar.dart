import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab03tasks/DefaultColors.dart';

Widget buildAppBar(BuildContext context,Color productColor){

  return AppBar(
    backgroundColor: productColor,
    elevation: 0,
    leading: IconButton(icon: SvgPicture.asset("assets/icons/back.svg",color: Colors.white,) ,onPressed: ()=>{
      Navigator.pop(context),
    },),
    actions:<Widget>[
      IconButton(icon: SvgPicture.asset("assets/icons/search.svg",color:Colors.white),onPressed: ()=>{}),
      IconButton(icon: SvgPicture.asset("assets/icons/cart.svg",color:Colors.white),onPressed: ()=>{}),
      SizedBox(width: kDefaultPadding / 2)
    ],
  );
}