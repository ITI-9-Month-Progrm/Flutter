import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab04/Repos/userRepo.dart';
import 'package:lab04/Models/newUser.dart';
//import 'package:lab04/Screens/CreateUser/components/success_dialog.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class CreateUserScreen extends StatefulWidget {
  static final routeName = "/addUser";

  CreateUserScreen({Key key}) : super(key: key);

  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  String _name, _job, x;
  NewUser _newUser;
  final _postForm = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    this._name = "";
    this._job = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Column(
                children: [
                  /// Row 1
                  _getFirstRow(),
                  Padding(
                    padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Form(
                      key: _postForm,
                      child: Column(
                        children: [
                          _getNameText(),
                          SizedBox(
                            height: 30,
                          ),
                          _getJobText(),
                          SizedBox(
                            height: 30,
                          ),
                          _getSubmitButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              )),

              //Image(image: AssetImage('assets/images/male.jpg')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getFirstRow() {
    return Stack(
      children: [
        Container(
          //color:Colors.lightBlueAccent, //Color(0x34b1eb),
          height: MediaQuery.of(context).size.height / 3.8,
          width: MediaQuery.of(context).size.width,

          ///1.1444,
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(MediaQuery.of(context).size.width / 3),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 80, left: 180),
          child: Image.asset("assets/images/add-friend.png",
              height: 100, width: 100, color: Colors.white),
        ),
      ],
    );
  }

  Widget _getNameText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Colors.lightBlueAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          labelText: "Name"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Please Enter Your Name";
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _getJobText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.work,
            color: Colors.lightBlueAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          labelText: "Job"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Please Enter Your Job";
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _job = value;
      },
      onFieldSubmitted: (String value) {
        print(value);
      },
    );
  }

  Widget _getSubmitButton() {
    return showCustomDialog(context);
  }

  Widget showCustomDialog(BuildContext context) {
    return MaterialButton(
      minWidth: 300,
      onPressed: () => {
        if (_postForm.currentState.validate())
          {
            _postForm.currentState.save(),
            print("Final Result : "),
            print(_name + "And" + _job),
            UserRepo().addUser(_name, _job).then((value) => print('name : ' + value.name)),

            Dialogs.materialDialog(
              color: Colors.white,
              msg: '${UserRepo.Name} is a new employee',
              title: 'Congratulations',
              // animation: 'assets/images/star.gif',
              customView: Image.asset("assets/images/star.gif",
                  width: 300, height: 400, fit: BoxFit.contain),
              context: context,
              actions: [
                IconsButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  },
                  text: 'Ok',
                  iconData: Icons.done,
                  color: Colors.blue,
                  textStyle: TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ],
            ),
          }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.lightBlueAccent,
        ),
        width: MediaQuery.of(context).size.width / 1.2875,
        height: 50,
        margin: EdgeInsets.only(
            left: 30, top: MediaQuery.of(context).size.height / 7.75),
        padding: EdgeInsets.only(top: 10, left: 130),
        child: Text(
          "Add",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _getNewUser() async {

    await UserRepo().addUser(_name, _job).then(( result){
      setState(() {
        x = result.name;
      });
    });

  }
}


