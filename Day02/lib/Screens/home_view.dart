import 'package:flutter/material.dart';

class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }

}

class _HomeViewState extends State<HomeView>{
  int _counter=0;
  @override
  // ignore: missing_return
  Widget build(BuildContext context){
    return _getMyHome();

  }
  Widget _getMyHome(){
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
              Text("State of Counter is ", style: TextStyle(fontSize: 20),),
              Text("$_counter",  style: TextStyle(fontSize: 50),)
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

              _decremintal();

            },
          ),
          ),
          Expanded(child: FloatingActionButton(
            child: Icon(Icons.add,),
            backgroundColor: Colors.grey,
            onPressed: (){
             _incremintal();
            },
          ),
          ),
        ],
      ),
    );


  }
  void _incremintal(){
    setState(() {
      _counter++;
    });
  }
  void _decremintal(){
    setState(() {
      _counter--;
    });
  }
}








