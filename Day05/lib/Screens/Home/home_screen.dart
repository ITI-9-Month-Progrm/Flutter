import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab05/Bloc/user_bloc.dart';
import 'package:lab05/Event/user_event.dart';
import 'package:lab05/Models/generic_data.dart';
import 'package:lab05/Models/user.dart';
import 'package:lab05/Repos/userRepo.dart';
import 'package:lab05/Screens/CreateUser/create_user_screen.dart';
import 'package:lab05/Screens/Home/components/user_card_list.dart';
import 'dart:ui';
import 'package:lab05/Screens/Details/detailsArgs.dart';

class HomeView extends StatefulWidget {
  static final routeName = '/';


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {
  UserBloc userBloc ;
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    //HomeView(),
    //CreateUserScreen(),

  ];
  @override
  void initState() {
    super.initState();
    userBloc=UserBloc();
    userBloc.add(UserList());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.4)
            
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Right Tab bar icons
            ],
          ),
        ),
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getUserList() {
    return BlocBuilder<UserBloc, GeneralState<UsersListState>>(
        bloc: userBloc,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.usersList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: UserCardItem(user: snapshot.data.usersList[index],

                        press:()=>{
                        userBloc.add(SingleUser(selectedUserId: snapshot.data.usersList[index].id)),
                          // Navigator.pushNamed(context, "/userDetails",
                          //   arguments: ScreenArguments(snapshot.data.selectedUser),
                          // )
                        Navigator.pushNamed(context, "/userDetails",
                          arguments: ScreenArguments(snapshot.data.usersList[index]),
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


}
