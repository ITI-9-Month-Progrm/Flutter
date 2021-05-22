import 'package:lab05/Models/newUser.dart';
import 'package:lab05/Models/user.dart';

abstract class UserEvents{}
class UserList extends UserEvents{}
class SingleUser extends UserEvents{
  int selectedUserId ;
  SingleUser({this.selectedUserId});
}
class AddUser extends UserEvents{
  String name, job;
  AddUser({this.name, this.job});
}


/// To Treatment with data like get, update and etc
class UsersListState {
  List<User> usersList;
  User selectedUser;
  NewUser newUser;
  UsersListState({this.usersList, this.selectedUser, this.newUser});
}