import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../widgets/const.dart';
import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          const SizedBox(height: 165),
          const Text(
            "Welcome to",
            style: TextStyle(
              fontFamily: "inter_bold",
              fontWeight: FontWeight.w600,
              fontSize: 33,
            ),
          ),
          const Text(
            "Expense Tracker",
            style: TextStyle(
              fontFamily: "inter_bold",
              fontWeight: FontWeight.w600,
              fontSize: 33,
            ),
          ),
          const SizedBox(height: 145),
          Image.asset("assets/icons/welcome.png", fit: BoxFit.fitWidth),
        ],
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
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Login with ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "inter_medium",
                        ),
                      ),
                      TextSpan(
                        text: "Phone Number",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "inter_bold",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "by Clicking log in, you agree with our ",
                      style: TextStyle(
                        color: lightGrey,
                        fontSize: 13,
                        fontFamily: "inter_medium",
                      ),
                    ),
                    TextSpan(
                      text: "Terms & Conditions",
                      style: const TextStyle(
                        color: customGreen,
                        fontSize: 13,
                        fontFamily: "inter_medium",
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () async {},
                    ),
                    const TextSpan(
                      text: " and ",
                      style: TextStyle(
                        color: lightGrey,
                        fontSize: 13,
                        fontFamily: "inter_medium",
                      ),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: const TextStyle(
                        color: customGreen,
                        fontSize: 13,
                        fontFamily: "inter_medium",
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () async {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * (0.0250)),
          ],
        ),
      ),
    );
  }
}
