import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/colorpallete.dart';
import '../widgets/const.dart';
import '../widgets/custombutton.dart';
import '../widgets/feildcontainer.dart';
import '../widgets/iconpallete.dart';
import '../widgets/listoficons.dart';
import 'homepage.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final TextEditingController _nameofcategory = TextEditingController();

  Color? selectedColor;
  IconData? icon;
  IconData? selectedIcon;
  Color newcolor = customGreen;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.45,
        title: const Text(
          "Add Category",
          style: TextStyle(
            fontFamily: "inter_regular",
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenwidth * (0.0603)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * (0.03459)),
            const Text(
              "Name",
              style: TextStyle(
                fontFamily: "inter_semibold",
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 11),
            FeildContainer(
              initialText: "Entertainment",
              controllername: _nameofcategory,
              lengthoftext: 25,
              isSpace: true,
            ),
            SizedBox(height: screenHeight * (0.0267)),
            const Text(
              "Icons",
              style: TextStyle(
                fontFamily: "inter_semibold",
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 11),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...svgicons
                    .map((e) => IconPallet(
                          iconName: e,
                          clicked: selectedIcon == e,
                          onClick: () {
                            selectedIcon = e;
                            setState(() {});
                          },
                        ))
                    .toList(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // openiconpicker();
                    });
                  },
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                          )
                        ]),
                    child: icon == null
                        ? SvgPicture.asset(
                            "assets/icons/+.svg",
                            fit: BoxFit.scaleDown,
                            color: Colors.black,
                          )
                        : Icon(icon),
                  ),
                )
              ],
            ),
            SizedBox(height: screenHeight * (0.0267)),
            const Text(
              "Colors",
              style: TextStyle(
                fontFamily: "inter_semibold",
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 11),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...colorsPlatter
                    .map(
                      (e) => ColorPallete(
                        colorName: e,
                        clicked: selectedColor == e,
                        onClick: () {
                          selectedColor = e;
                          setState(() {});
                        },
                      ),
                    )
                    .toList(),
                GestureDetector(
                  onTap: () {
                    pickColor(context);
                  },
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/+.svg",
                      fit: BoxFit.scaleDown,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenwidth * (0.0603)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              screenHeight: screenHeight,
              textForButton: "Continue",
            ),
            SizedBox(height: screenHeight * (0.0306)),
          ],
        ),
      ),
    );
  }

  // Color Picker

  Widget buildColorPicker() => ColorPicker(
        labelTypes: const [],
        enableAlpha: false,
        pickerColor: newcolor,
        onColorChanged: (color) => setState(() {
          newcolor = color;
          colorsPlatter[0] = newcolor;
        }),
      );

  void pickColor(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Pick Any Color"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildColorPicker(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Select"),
                  ),
                ],
              ),
            ));
  }
}

List<Color> colorsPlatter = [
  customGreen,
  Colors.red,
  Colors.purple,
  Colors.cyan,
  Colors.yellow,
];
