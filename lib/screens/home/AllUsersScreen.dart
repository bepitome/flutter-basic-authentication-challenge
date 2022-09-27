import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../api/api.dart';
import '../../components/MyCard.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({super.key});

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  List<MyCard> allUsersCards = [];

  Future<void> _handleRefresh() async {
    try {
      var response = await API.getAllUsers();

      var decodedData = jsonDecode(response.body);
      decodedData = decodedData['result'];

      setState(
        () async {
          for (var user in decodedData) {
            allUsersCards.add(MyCard(
                name: 'Full Name',
                value: "${user['first_name']} ${user['last_name']} "));
          }
        },
      );
    } catch (e) {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LiquidPullToRefresh(
        color: Color(0xFF6C63FF),
        height: 300,
        showChildOpacityTransition: true,
        onRefresh: _handleRefresh,
        child: ListView(
          children: [
            ...allUsersCards
          ],
        ),
      ),
    );
  }
}
