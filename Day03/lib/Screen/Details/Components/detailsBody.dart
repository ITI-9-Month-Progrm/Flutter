import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab03tasks/Model/Product.dart';
import 'package:lab03tasks/Screen/Details/Components/priceAndImage.dart';
import 'package:lab03tasks/Screen/Details/Components/color_size.dart';
import 'package:lab03tasks/Screen/Details/Components/item_counter.dart';
class DetailsBody extends StatelessWidget {
  final Product product;
  DetailsBody({this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: size.height * 0.6452, // = 500
                    margin: EdgeInsets.only(top: size.height * 0.3), // 230
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Column(
                      children:<Widget> [
                       ColorAndSize(size, product.color, product.size), /// Row 1
                        SizedBox(height: 30,),
                        Container(
                         padding: EdgeInsets.all(10),
                         margin: EdgeInsets.only(left: 20),
                         child: Text("${product.description}"),
                       ),///Row 2
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           ItemCounter(),
                           Container(
                             padding: EdgeInsets.all(8),
                             margin: EdgeInsets.only(right: 30),
                             height: 32,
                             width: 32,
                             decoration: BoxDecoration(
                               color: Colors.red,//Color(0xFFFF6464),
                               shape: BoxShape.circle,
                             ),
                             child: SvgPicture.asset("assets/icons/heart.svg"),
                           )

                         ],
                       ),///Row 3
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(left: 20),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                //color: Colors.red,//Color(0xFFFF6464),
                                //shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset("assets/icons/add_to_cart.svg"),
                            ),
                            FlatButton(onPressed: (){}, 
                                child: Container(
                                  height: 50,
                                  width: 200,

                                  decoration: BoxDecoration(
                                    color: product.color,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),

                                    child: Text("         Buy Now",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 25,

                                    ),
                                    ),
                                  )
                                ),
                            )
                          ],
                        ),///Row 4
                      ],
                    ),/// Main Column
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Aristocratic Hand Bag",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Office Code",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  PriceImage(context, product),
                ],
              )),
        ],
      ),
    );
  }
}
