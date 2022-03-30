import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nems/auth/widgets/otp_input.dart';

class CheckOtp extends StatefulWidget {
  const CheckOtp({Key? key}) : super(key: key);

  @override
  State<CheckOtp> createState() => _CheckOtpState();
}

class _CheckOtpState extends State<CheckOtp> {
  final darkTextColor = Color(0xff1F1A3D);
  final lightTextColor = Color(0xff999999);
  final linkColor = Color(0xFF1b72e8);
  final buttonColor = Color(0xFFb20732);

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Let’s confirm that it’s you",
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
                  "We’ve sent a 6-digits code to xxxxxxxxxx772. Please enter the verification code to continue.",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: lightTextColor,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpInput(_fieldOne, true),
                    OtpInput(_fieldTwo, false),
                    OtpInput(_fieldThree, false),
                    OtpInput(_fieldFour, false),
                    OtpInput(_fieldFive, false),
                    OtpInput(_fieldSix, false)
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {
                    print("do not have mrn");
                  },
                  child: Text(
                    "Resend the code",
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
                    "Send me a code by email instead",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: darkTextColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
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
                    child: Text("Continue"),
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
