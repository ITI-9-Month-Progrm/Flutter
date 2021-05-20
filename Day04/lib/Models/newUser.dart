import 'dart:convert';

class NewUser{
  String name, job, id, createdAt;

  NewUser({this.id, this.name, this.job, this.createdAt});

  NewUser.fromJson(Map json){
    this.id = json['id'];
    this.name = json['name'];
    this.job = json['job'];
    this.createdAt = json['createdAt'];
  }
}

