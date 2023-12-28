import 'package:expensetracker/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../expensecategoriesicons.dart';

class ListViewContent extends StatelessWidget {
  const ListViewContent({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * (0.0603)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * (0.005)),
          SizedBox(height: screenHeight * (0.005)),
          const Text(
            "Expense List",
            style: TextStyle(
              fontFamily: "inter_semibold",
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenHeight * (0.0223)),
          Wrap(
            runSpacing: 5,
            spacing: 5,
            children: const [
              ExpenseCategoriesIcons(
                svgIconPath: "assets/icons/bill.svg",
                categoryColor: customRed,
                categoryName: "Bill",
              ),
              ExpenseCategoriesIcons(
                svgIconPath: "assets/icons/entertainment.svg",
                categoryColor: customDarkGrey,
                categoryName: "Entertainment",
              ),
              ExpenseCategoriesIcons(
                svgIconPath: "assets/icons/food.svg",
                categoryColor: customYellow,
                categoryName: "Food",
              ),
              ExpenseCategoriesIcons(
                svgIconPath: "assets/icons/car.svg",
                categoryColor: customBlue,
                categoryName: "Cars",
              ),
              ExpenseCategoriesIcons(
                svgIconPath: "assets/icons/entertainment.svg",
                categoryColor: customDarkGrey,
                categoryName: "Shopping",
              ),
              ExpenseCategoriesIcons(
                svgIconPath: "assets/icons/food.svg",
                categoryColor: customRed,
                categoryName: "Drinks",
              ),
              ExpenseCategoriesIcons(
                svgIconPath: "assets/icons/bill.svg",
                categoryColor: customBlue,
                categoryName: "Care",
              ),
              ExpenseCategoriesIcons(
                svgIconPath: "assets/icons/bill.svg",
                categoryColor: customYellow,
                categoryName: "Tax",
              ),
            ],
          ),
          const SizedBox(height: 2),
          SizedBox(height: screenHeight * (0.0323)),
          const Text(
            "Entertainment",
            style: TextStyle(
              fontFamily: "inter_semibold",
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenHeight * (0.0212)),
          ListView.separated(
            physics: const ScrollPhysics(),
            primary: true,
            shrinkWrap: true,
            itemCount: 8,
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
                child: Row(
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
                      "Movie",
                      style: TextStyle(
                        fontFamily: "inter_regular",
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
                              fontFamily: "inter_semibold",
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "10:00 AM",
                            style: TextStyle(
                              letterSpacing: 2,
                              fontFamily: "inter_semibold",
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
              );
            },
          ),
          const SizedBox(height: 75),
        ],
      ),
    );
  }
}
