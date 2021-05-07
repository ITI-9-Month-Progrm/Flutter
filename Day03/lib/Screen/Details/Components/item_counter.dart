import 'package:flutter/material.dart';

class ItemCounter extends StatefulWidget {
  ItemCounter({Key key}) : super(key: key);

  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int _num;
  @override
  void initState() {
    _num = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox( width: 30,),
        buildOutlineButton(
          icon: Icons.remove,
          press: (){
            if(_num > 1){
              setState(() {
                _num--;
              });
            }
          }
        ),
        SizedBox( width: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            _num.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),

        buildOutlineButton(
            icon: Icons.add,
            press: (){

                setState(() {
                  _num++;
                });

            }
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }


}