import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab03tasks/DefaultColors.dart';
import 'package:lab03tasks/Model/Product.dart';


class ProductItem extends StatelessWidget{
  final Product product;
  final Function press;
  const ProductItem({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return productCard(context, product, press);
  }
}

Widget productCard(BuildContext context,Product product, Function press){
  return   GestureDetector(
    onTap: press,
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(kDefaultPadding),
           //height: MediaQuery.of(context).size.height/4.2,
           //width: width/2.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: product.color
          ),
          child: Image.asset(product.image),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: kDefaultPadding/4),
          child: Text(
            product.title,
            style: TextStyle(
              color: kTextLightColor,

            ),

          ),
        ),
        Text("\$${product.price}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}