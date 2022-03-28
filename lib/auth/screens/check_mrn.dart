// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nems/auth/domain/models/verify_mrn_model.dart';
import 'package:nems/auth/domain/repository/user_repository.dart';
import 'package:nems/auth/domain/repository/user_repository_impl.dart';
import 'package:nems/auth/domain/services/login_service.dart';
import 'package:nems/core/api_client.dart';

class CheckMrn extends StatefulWidget {
  const CheckMrn({Key? key}) : super(key: key);

  @override
  State<CheckMrn> createState() => _CheckMrnState();
}

class _CheckMrnState extends State<CheckMrn> {
  TextEditingController mrncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter TextField Example'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: mrncontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Sign In'),
                  onPressed: () async {
                    print("kjhkdasd");
                    print(mrncontroller.text);
                    ApiClient apiClient = ApiClient(Client());
                    LoginUser loginUser = LoginUserImpl(apiClient);
                    UserRepository user = UserRepositoryImpl(loginUser);
                    var data = {'mrn': mrncontroller.text, 'code': '12345'};
                    final mrnData = await user.verifyMrn(data);
                    print(mrnData);
                    // print(mrnData.message);
                    // print(mrnData.telecom);r
                    // print(mrnData.channel);
                  },
                )
              ],
            )));
  }
}
