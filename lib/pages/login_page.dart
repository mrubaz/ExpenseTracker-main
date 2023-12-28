// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../widgets/const.dart';
import 'verification_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * (0.0603),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 150, width: double.infinity),
            const Text(
              "Login With Phone Number",
              style: TextStyle(
                fontFamily: "inter_bold",
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * (0.07),
                vertical: MediaQuery.of(context).size.height * (0.025),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text:
                      "We will send you verification code on your Phone Number",
                  style: TextStyle(
                    fontFamily: "inter_medium",
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: lightGrey,
                  ),
                ),
              ),
            ),
            IntlPhoneField(
              decoration: const InputDecoration(
                counter: Offstage(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(
                    color: customGreen,
                    width: 1.5,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * (0.0603),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: customGreen,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VerificationPage()),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontFamily: "inter_semibold",
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * (0.0306)),
          ],
        ),
      ),
    );
  }
}
