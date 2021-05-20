import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:lab04/Models/user.dart';
import 'package:lab04/Repos/userRepo.dart';
import 'package:lab04/Screens/Home/components/user_card_list.dart';
import 'dart:ui';
import 'package:lab04/Screens/Details/detailsArgs.dart';

class HomeView extends StatefulWidget {
  static final routeName = '/';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {
  Future<List<User>> _userList;
  List<Widget> _images = [];
  List<String> _titles = [];
  List<User> _users = [];

  _initializedUsersData() {
    _userList = UserRepo().getUsers();
    print(_userList);
  }

  _initializedPager(Future<List<User>> users) async {
    _users = await users;
    print("_users");
    print(_users);

    if (_users.isNotEmpty) {
      for (int i = 0; i < _users.length; i++) {
        _images[i] = Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_users[i].image),
              fit: BoxFit.cover,
            ),
          ),
        );

        _titles[i] = _users[i].name;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initializedUsersData();
    _initializedPager(_userList);
    print(_images );
    print("image");
    print(_titles);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,),
        backgroundColor: Colors.lightBlue,
        onPressed: (){
                Navigator.pushNamed(context, "/addUser");

        },
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/pic1.jpg"),
                      fit: BoxFit.cover),
                ),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: _getUserList()),
              ),
            ),
          ],
        ),
      ),
    );
  }





  Widget _getUserList() {
    return FutureBuilder<List<User>>(
        future: _userList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: UserCardItem(user: snapshot.data[index],

                        press:()=>{

                        Navigator.pushNamed(context, "/userDetails",
                          arguments: ScreenArguments(snapshot.data[index]),
                        )
                      }
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _getUserListVertical() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: VerticalCardPager(
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                titles: _titles,
                images: _images,
                onPageChanged: (page) {},
                onSelectedItem: (index) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
