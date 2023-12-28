import 'package:expensetracker/pages/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/const.dart';
import 'homepage.dart';
import 'package:pinput/pinput.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final pinControle = TextEditingController();
  final customPinTheme = const PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 24,
      fontFamily: "inter_regular",
    ),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: customGreen),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * (0.0550),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomSizedBox(cheight: 70, cwidth: double.infinity),
            const Text(
              "Account Verification",
              style: TextStyle(
                fontFamily: "inter_bold",
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            const CustomSizedBox(cheight: 19, cwidth: 0.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * (0.07),
                vertical: MediaQuery.of(context).size.height * (0.025),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text:
                      "6 digit code has been sent to your provided phone number 124-561-111",
                  style: TextStyle(
                    fontFamily: "inter_medium",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: lightGrey,
                  ),
                ),
              ),
            ),
            const CustomSizedBox(cheight: 50, cwidth: 0.0),
            Pinput(
              length: 6,
              controller: pinControle,
              defaultPinTheme: customPinTheme,
            ),
            const CustomSizedBox(cheight: 30, cwidth: 0.0),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "if you didn’t recieve a code ",
                    style: TextStyle(
                      color: lightGrey,
                      fontSize: 14,
                      fontFamily: "inter_medium",
                    ),
                  ),
                  TextSpan(
                    text: "Resend",
                    style: const TextStyle(
                      color: customGreen,
                      fontSize: 14,
                      fontFamily: "inter_medium",
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () async {},
                  ),
                ],
              ),
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
                  MaterialPageRoute(builder: (context) => const HomePage()),
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

class CustomSizedBox extends StatelessWidget {
  final double cheight;
  final double cwidth;
  const CustomSizedBox({
    Key? key,
    required this.cheight,
    required this.cwidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: cheight, width: cwidth);
  }
}
