// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nems/auth/domain/models/verify_mrn_model.dart';
import 'package:nems/auth/domain/repository/user_repository.dart';
import 'package:nems/auth/domain/repository/user_repository_impl.dart';
import 'package:nems/auth/domain/services/login_service.dart';
import 'package:nems/auth/screens/check_otp.dart';
import 'package:nems/core/api_client.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckMrn extends StatefulWidget {
  const CheckMrn({Key? key}) : super(key: key);

  @override
  State<CheckMrn> createState() => _CheckMrnState();
}

class _CheckMrnState extends State<CheckMrn> {
  final purpleColor = Color(0xff6688FF);
  final darkTextColor = Color(0xff1F1A3D);
  final lightTextColor = Color(0xff999999);
  final textFieldColor = Color(0xffF5F6FA);
  final borderColor = Color(0xffD9D9D9);
  final linkColor = Color(0xFF1b72e8);
  final buttonColor = Color(0xFFb20732);

  Widget getTextField({required String hint}) {
    return TextField(
      style: TextStyle(
        fontSize: 23.sp,
        height: 0.75.sp,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: darkTextColor, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: darkTextColor, width: 0),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          filled: true,
          fillColor: textFieldColor,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: buttonColor,
            size: 50,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 52.h,
                ),
                Text(
                  "Sign in with your MRN number",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    color: darkTextColor,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Please enter the MRN number located on your NEMS membership card to sign in to your account.",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: lightTextColor,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                getTextField(hint: "MRN Number"),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {
                    print("do not have mrn");
                  },
                  child: Text(
                    "Don’t have your MRN Number?",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: linkColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                InkWell(
                  onTap: () {
                    print("where is my mrn");
                  },
                  child: Text(
                    "Where is my MRN Number?",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: darkTextColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckOtp()),
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttonColor),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.r),
                                    side: BorderSide(color: buttonColor))),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 14.h)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ))),
                    child: Text("Continue"),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      "or",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: lightTextColor,
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttonColor),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.r),
                                    side: BorderSide(color: buttonColor))),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 14.h)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ))),
                    child: Text("Scan Qr"),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
