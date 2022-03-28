import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:core';
import 'dart:io';
import 'package:nems/auth/domain/services/login_service.dart';
import 'package:nems/auth/screens/check_mrn.dart';
import 'package:nems/core/api_client.dart';

void main() {
  // ApiClient apiClient = ApiClient(Client());
  // LoginUser user = LoginUserImpl(apiClient);
  // var data = {
  //   'mrn': '1084411',
  // };
  // user.loginUser(data);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CheckMrn(),
    );
  }
}
