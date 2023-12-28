// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:expensetracker/widgets/gridview/sliderpartone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:expensetracker/widgets/const.dart';
import 'sliderparttwo.dart';

class GridViewContent extends StatefulWidget {
  const GridViewContent({Key? key}) : super(key: key);

  @override
  State<GridViewContent> createState() => _GridViewContentState();
}

class _GridViewContentState extends State<GridViewContent> {
  bool slidernumber = true;
  List<FoodCategory> data = [
    FoodCategory(20, Colors.yellow),
    FoodCategory(15, Colors.red),
    FoodCategory(5, const Color(0xff5B2AE7)),
    FoodCategory(10, customGreen),
    FoodCategory(10, Colors.deepPurple),
    FoodCategory(10, Colors.brown),
    FoodCategory(10, Colors.orangeAccent),
    FoodCategory(10, Colors.greenAccent),
    FoodCategory(10, Colors.pinkAccent),
  ];

  @override
  Widget build(BuildContext context) {
    data.sort((b, a) => a.value.compareTo(b.value));
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * (0.0603),
      ),
      child: Column(
        children: [
          SizedBox(height: screenHeight * (0.0267)),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    slidernumber = !slidernumber;
                  });
                },
                child: slidernumber == false
                    ? const Icon(
                        Icons.chevron_left,
                        color: customGreen,
                      )
                    : const Offstage(),
              ),
              slidernumber == true
                  ? SliderPartOne(screenwidth: screenwidth)
                  : SlidePartTwo(screenwidth: screenwidth),
              GestureDetector(
                onTap: () {
                  setState(() {
                    slidernumber = !slidernumber;
                  });
                },
                child: slidernumber == true
                    ? const Icon(
                        Icons.chevron_right,
                        color: customGreen,
                      )
                    : const Offstage(),
              ),
            ],
          ),
          SizedBox(height: screenHeight * (0.0267)),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              ...data.mapIndexed((index, e) {
                var percenatge = 0.0;
                for (int i = index; i < data.length; i++) {
                  percenatge += data[i].value;
                }
                return CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 17.0,
                  percent: percenatge / 100,
                  backgroundColor: Colors.transparent,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: const Text(
                    "Rs.48,000",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "inter_bold",
                    ),
                  ),
                  progressColor: e.color,
                  animation: true,
                );
              })
            ],
          ),
          SizedBox(height: screenHeight * (0.0267)),
          ListView.separated(
            physics: const ScrollPhysics(),
            primary: true,
            shrinkWrap: true,
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: screenHeight * (0.0982),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: customDarkGrey),
                            child: SvgPicture.asset(
                              "assets/icons/bill.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          const SizedBox(width: 18),
                          const Text(
                            "Food",
                            style: TextStyle(
                              fontFamily: "inter_medium ",
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "Rs. 1500",
                                  style: TextStyle(
                                    fontFamily: "inter_medium",
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "10:00 AM",
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    fontFamily: "inter_medium",
                                    fontSize: 14,
                                    color: lightGrey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 18),
                        ],
                      ),
                      const SizedBox(height: 9),
                      LinearPercentIndicator(
                        percent: 0.3,
                        progressColor: Colors.amber,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 75),
        ],
      ),
    );
  }
}

class FoodCategory {
  final double value;
  final Color color;

  FoodCategory(this.value, this.color);
}
