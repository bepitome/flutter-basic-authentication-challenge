import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateProvider<Auth>((ref) => Auth(accessToken : '' , id: 0 ));

class Auth {
  final String accessToken;
  final int id;


  Auth({
    required this.accessToken,
    required this.id,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      accessToken: json['result']['accessToken'],
      id: json['result']['id'],
    );
  }

  @override
  String toString() {
    return 'Auth{accessToken: $accessToken, id: $id}';
  }
}
