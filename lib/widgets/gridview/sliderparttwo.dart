import 'package:expensetracker/widgets/const.dart';
import 'package:flutter/material.dart';

class SlidePartTwo extends StatefulWidget {
  const SlidePartTwo({
    Key? key,
    required this.screenwidth,
  }) : super(key: key);

  final double screenwidth;

  @override
  State<SlidePartTwo> createState() => _SlidePartTwoState();
}

class _SlidePartTwoState extends State<SlidePartTwo> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(1990, 01, 15),
    end: DateTime(2022, 10, 14),
  );

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return Container(
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
            child: InkWell(
              onTap: pickDateRange,
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: customGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    "${start.day}/${start.month}/${start.year}",
                    style: const TextStyle(
                        fontFamily: "inter_medium",
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Center(
                child: Text(
                  "-",
                  style: TextStyle(
                    fontFamily: "inter_medium",
                    fontSize: 14,
                    color: customGreen,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: pickDateRange,
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: customGreen,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    "${end.day}/${end.month}/${end.year}",
                    style: const TextStyle(
                      fontFamily: "inter_medium",
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      // initialDateRange: DateTimeRange(1990, 01, 15 , 2023),
      firstDate: DateTime(1900),
      lastDate: DateTime(2022),
      builder: ((context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 160,
          ),
          child: child,
        );
      }),
    );
    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
  }
}
