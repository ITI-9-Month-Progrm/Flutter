import 'package:flutter/material.dart';
import 'package:lab03tasks/Model/product.dart';

Widget ColorDot(Size size, Color color){
  return   Container(
    padding: EdgeInsets.all(3),
    height: 25,
    width: 25,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: color
        )
    ),
    child:  Container(
      padding: EdgeInsets.all(3),
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color
      ),
    ),
  );
}

Widget ColorDotWithOut(Size size, Color color){
  return    Container(
    padding: EdgeInsets.all(3),
    height: 25,
    width: 25,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color
    ),
  );
}
Widget ColorAndSize (Size size, Color color, productSize){
  return  Row( // Row1
    children:<Widget> [
      Padding(padding: EdgeInsets.only(
        top: size.height*0.12,
        left: 20,
      ),
        child:Column(
          children: [
            Text("Color"),
            SizedBox(height: 10,),
            Row(

              children: [

                ColorDot(size, color),
                SizedBox(width: 10,),
                ColorDotWithOut(size, Colors.black),
                SizedBox(width: 10,),
                ColorDotWithOut(size, Colors.pink),
              ],
            )
          ],
        ),
      ),
      Padding(padding: EdgeInsets.only(
        top: size.height*0.12,
        left: 100,
      ),
          child:Column(
            children: [
              Text("Size"),
              SizedBox(height: 10,),
              Text("${productSize} Cm",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              )
            ],
          )),
    ],

  );
}