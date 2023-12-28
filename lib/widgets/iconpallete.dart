import 'package:flutter/material.dart';

class IconPallet extends StatefulWidget {
  final IconData iconName;

  const IconPallet({
    Key? key,
    this.onClick,
    required this.clicked,
    required this.iconName,
  }) : super(key: key);

  @override
  State<IconPallet> createState() => _IconPalletState();
  final VoidCallback? onClick;
  final bool clicked;
}

class _IconPalletState extends State<IconPallet> {
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
                color: widget.clicked == true
                    ? const Color(0xff06AC71)
                    : Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                  )
                ]),
            child: Icon(
              widget.iconName,
              color: widget.clicked == false ? Colors.black : Colors.white,
            ),
          ),
        ),
        SizedBox(width: screenwidth * (0.0217)),
      ],
    );
  }
}
