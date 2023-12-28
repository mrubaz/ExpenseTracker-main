import 'package:expensetracker/widgets/const.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.screenHeight,
    required this.textForButton,
  }) : super(key: key);

  final double screenHeight;
  final String textForButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: screenHeight * (0.0625),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(customGreen),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontFamily: "inter_regular",
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            )),
        onPressed: () {},
        child: Text(
          textForButton,
        ),
      ),
    );
  }
}
