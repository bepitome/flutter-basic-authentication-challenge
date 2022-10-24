import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signedInUserStateProvider = StateProvider<User>(
  (ref) => User(
    id: 0,
    firstName: '',
    lastName: '',
    email: '',
    username: '',
    company: '',
    password: '',
    gender: '',
  ),
);

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String company;
  final String password;
  final String gender;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.company,
    required this.password,
    required this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      username: json['username'],
      company: json['company'],
      password: json['password'],
      gender: json['gender'],
    );
  }

  static List<User> setUsersList(List<dynamic> json) {
    List<User> users = [];

    print(json.length);
    for (int i = 0; i < json.length; i++) {
        users.add(User.fromJson(json[i]));
    }

    

    print(users[98].firstName); 

    return users;
  }
}
