import 'package:flutter/material.dart';
import 'package:lab03tasks/DefaultColors.dart';
import 'package:lab03tasks/Model/productList.dart';
import 'package:lab03tasks/Screen/Home/Components/category.dart';
import 'package:lab03tasks/Screen/Home/Components/productItem.dart';
import 'package:lab03tasks/Screen/Details/screenArgs.dart';

class BodyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              "Women",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          CategoryView(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.72,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20),
                itemBuilder: (context, index) => ProductItem(product:products[index],
                    press:()=>{
                  Navigator.pushNamed(context, "/Details",
                  arguments: ScreenArguments(products[index]),
                  )
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
