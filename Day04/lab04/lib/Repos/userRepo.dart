import 'package:lab04/Models/newUser.dart';
import 'package:lab04/Services/httpHandler.dart';
import 'package:lab04/Models/user.dart';
import 'package:lab04/Services/httpHandler.dart';


class UserRepo{
  String endPoint = "/users";
  static String Name;
  Future<List<User>> getUsers() async {
    try {
      dynamic response = await HttpServices().httpGet(endPoint);
      Iterable usersList = response['data'];
      List<User> users = usersList.map((user) => User.fromJson(user)).toList();
      return users;
    } catch (error) {
      print("Get users error");
      print(error);
      throw Exception("Error getting users list");
    }
  }
  Future<NewUser> addUser(String name, String job) async{
    try {
      dynamic response = await HttpServices().httpPost(endPoint, name, job);
      print("response");
      print(response);
      Name = NewUser.fromJson(response).name;
      print('Name:' + Name);
      return NewUser.fromJson(response);
    }
    catch (error) {
      print("Get data error");
      print(error);
      throw Exception("Error Posting user");
    }
  }
}