import 'package:flutter/material.dart';

class ColorPallete extends StatefulWidget {
  const ColorPallete({
    Key? key,
    required this.colorName,
    this.onClick,
    required this.clicked,
  }) : super(key: key);

  @override
  State<ColorPallete> createState() => _ColorPalleteState();

  final Color colorName;
  final VoidCallback? onClick;
  final bool clicked;
}

class _ColorPalleteState extends State<ColorPallete> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        GestureDetector(
          onTap: widget.onClick,
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: widget.colorName,
              borderRadius: BorderRadius.circular(22),
            ),
            child: widget.clicked == true
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 26,
                  )
                : const Offstage(),
          ),
        ),
        SizedBox(width: screenwidth * (0.0217)),
      ],
    );
  }
}
