import 'package:flutter/material.dart';
import 'package:lab03tasks/DefaultColors.dart';
import 'package:lab03tasks/Model/productList.dart';
class CategoryView extends StatefulWidget{
  @override
  _CategoryViewState createState()=> _CategoryViewState();
}


class _CategoryViewState extends State<CategoryView>{
  /// why _selectedIndex is not work
  int selectedIndex ;
  List<String> _categoryList;
  initState(){
   selectedIndex =0;
    /// _categoryList = categories; Error return null
  }
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
    child: SizedBox(
      height: 25,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index)=>buildItemCategory(index),
        scrollDirection: Axis.horizontal,
      ),

    ),);
  }
  Widget buildItemCategory(int idx){
    return  GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = idx;
        });
      },
      child: Padding(padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text(categories[idx],
                style:TextStyle(fontWeight: FontWeight.bold,
                    color: selectedIndex == idx ? kTextColor : kTextLightColor) ),


            Container(
              margin: EdgeInsets.only(top: kDefaultPadding/4),
              color: selectedIndex == idx ? Colors.black : Colors.transparent,
              height: 2,
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}

