import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpenseCategoriesIcons extends StatelessWidget {
  final String svgIconPath;
  final String categoryName;
  final Color categoryColor;
  const ExpenseCategoriesIcons({
    Key? key,
    required this.svgIconPath,
    required this.categoryName,
    required this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: categoryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(svgIconPath),
              const SizedBox(width: 4),
              Text(
                categoryName,
                style: const TextStyle(
                  fontFamily: "inter_regular",
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        // SizedBox(width: screenWidth * (0.00724)),
      ],
    );
  }
}
