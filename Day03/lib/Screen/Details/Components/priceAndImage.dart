import 'package:flutter/material.dart';
import 'package:lab03tasks/Model/Product.dart';
Widget PriceImage(BuildContext context,Product product){
  return  Padding(padding: EdgeInsets.only(top: 30,left: 20),
    child:Row(

      children: <Widget> [
        RichText(text: TextSpan(
            children: [
              TextSpan(text: "Price\n"),
              TextSpan(text:"\$${product.price}",
                  style:Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ))
            ]
        ),),
        Expanded(child: Image.asset(product.image,fit: BoxFit.fill,))
      ],
    ) ,);
}