import 'package:flutter/material.dart';
import 'package:lab03tasks/Model/productList.dart';
import 'package:lab03tasks/Screen/Home/Components/appBar.dart';
import 'package:lab03tasks/Screen/Home/Components/appBody.dart';
class BagListView extends StatefulWidget{
  static final routeName = '/';
  @override
  _BagListViewState createState()=>_BagListViewState();
}
class _BagListViewState extends State<BagListView>{

  @override
  // TODO: implement context
 // TODO: implement widget
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyView(),
    );
  }
}