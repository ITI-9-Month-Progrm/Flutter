import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lab02/Screens/home_view.dart';

void main() {
  runApp(MyApp());
}
num _counter = 0;

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return _myApp();
  }

}

Widget _myApp(){
  return MaterialApp(
    home: HomeView(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
  );
}
/*Widget _getMyHome(){
  return Scaffold(
    appBar:_getAppBar() ,
    body: _getBody(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: _getFloatingActionButton(),
  );
}
Widget _getAppBar(){
  return AppBar(
    centerTitle: true,
    title: Text(
      "Hello Counter",
    ),
   //backgroundColor: Colors.green,
    leading: IconButton(icon:Icon(Icons.menu),onPressed: (){
      print("Menu Icon Is Clicked");
    },),
  );
}
Widget _getBody(){
  return Padding(padding: EdgeInsets.all(15),
  child: Center(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Colors.grey,Colors.deepPurple]
        ),
        borderRadius: BorderRadius.circular(10),

      ),
      height: 250.0,
      width: 400.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "Ay7aga Now", ),
        ],
      ),
    ),
  ),);
}
Widget _getFloatingActionButton(){
  return Padding(
      padding: EdgeInsets.all(50),
      child: Row(
        children:<Widget> [

          Expanded(child: FloatingActionButton(
            child: Icon(Icons.minimize,),
            backgroundColor: Colors.deepPurple,
            onPressed: (){
              print("Minus Cliecked");
            },
          ),
          ),
          Expanded(child: FloatingActionButton(
            child: Icon(Icons.add,),
            backgroundColor: Colors.grey,
            onPressed: (){
              print("Add Cliecked");
            },
          ),
          ),
        ],
      ),
  );


}*/

