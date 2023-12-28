import 'package:flutter/material.dart';
import 'package:expensetracker/widgets/const.dart';

class SliderPartOne extends StatefulWidget {
  const SliderPartOne({
    Key? key,
    required this.screenwidth,
  }) : super(key: key);

  final double screenwidth;

  @override
  State<SliderPartOne> createState() => _SliderPartOneState();
}

class _SliderPartOneState extends State<SliderPartOne> {
  bool clicked01 = false;
  bool clicked02 = false;
  bool clicked03 = false;
  bool clicked04 = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55,
          width: widget.screenwidth * (0.81),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: customGreen,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      clicked01 = !clicked01;
                      clicked02 = false;
                      clicked03 = false;
                      clicked04 = false;
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: clicked01 == true ? customGreen : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Daily",
                        style: TextStyle(
                          fontFamily: "inter_medium",
                          fontSize: 14,
                          color: clicked01 == true ? Colors.white : customGreen,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalDivider(
                width: 1,
                thickness: 2,
                color: customGreen,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      clicked01 = false;
                      clicked02 = !clicked02;
                      clicked03 = false;
                      clicked04 = false;
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: clicked02 == true ? customGreen : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Weekly",
                        style: TextStyle(
                          fontFamily: "inter_medium",
                          fontSize: 14,
                          color: clicked02 == true ? Colors.white : customGreen,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalDivider(
                width: 1,
                thickness: 2,
                color: customGreen,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      clicked01 = false;
                      clicked02 = false;
                      clicked03 = !clicked03;
                      clicked04 = false;
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: clicked03 == true ? customGreen : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Monthy",
                        style: TextStyle(
                          fontFamily: "inter_medium",
                          fontSize: 14,
                          color: clicked03 == true ? Colors.white : customGreen,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalDivider(
                width: 2,
                thickness: 2,
                color: customGreen,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      clicked01 = false;
                      clicked02 = false;
                      clicked03 = false;
                      clicked04 = !clicked04;
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: clicked04 == true ? customGreen : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Yearly",
                        style: TextStyle(
                          fontFamily: "inter_medium",
                          fontSize: 14,
                          color: clicked04 == true ? Colors.white : customGreen,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
