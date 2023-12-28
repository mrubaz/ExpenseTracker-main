import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeildContainer extends StatelessWidget {
  final int lengthoftext;
  final bool isSpace;
  final TextInputType? inputType;
  final String initialText;
  final TextEditingController controllername;
  const FeildContainer({
    Key? key,
    required this.initialText,
    required this.controllername,
    required this.isSpace,
    required this.lengthoftext,
    this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (0.0702),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controllername,
            style: const TextStyle(
              fontFamily: "inter_regular",
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            keyboardType: inputType,
            inputFormatters: [
              if (isSpace) FilteringTextInputFormatter.deny(RegExp(r'\s')),
              LengthLimitingTextInputFormatter(lengthoftext),
            ],
            decoration: InputDecoration(
              hintText: initialText,
              contentPadding: const EdgeInsets.symmetric(horizontal: 19),
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
