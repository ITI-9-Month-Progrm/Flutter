import 'package:flutter/material.dart';
import 'package:lab03tasks/Model/Product.dart';
import 'package:lab03tasks/Model/productList.dart';
import 'package:lab03tasks/Screen/Details/Components/appBar.dart';
import 'package:lab03tasks/Screen/Details/Components/detailsBody.dart';
import 'package:lab03tasks/Screen/Details/screenArgs.dart';


class DetailsView extends StatelessWidget{
  // final Product product;
  // DetailsView(this.product);
  static const routeName = "/Details";

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args =
    ModalRoute.of(context).settings.arguments as ScreenArguments;
    return Scaffold(
      backgroundColor:args.product.color ,
      appBar:buildAppBar(context, args.product.color) ,
      body: DetailsBody(product : args.product),

    );
  }


}