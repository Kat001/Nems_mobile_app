import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:core';
import 'dart:io';
import 'package:nems/auth/domain/services/login_service.dart';
import 'package:nems/auth/screens/check_mrn.dart';
import 'package:nems/auth/screens/check_otp.dart';
import 'package:nems/auth/screens/dash_board.dart';
import 'package:nems/auth/screens/index.dart';
import 'package:nems/core/api_client.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const DashBoard(),
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(360, 640),
    );
  }
}
