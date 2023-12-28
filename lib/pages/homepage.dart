import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/bottomsheet.dart';
import '../widgets/const.dart';
import '../widgets/gridview/gridview.dart';
import '../widgets/listview/listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool contentView = true;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            bottomSheetFloatingButton(context);
          });
        },
        elevation: 0,
        backgroundColor: customGreen,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.45,
        title: const Text(
          "Dashboard ",
          style: TextStyle(
            fontFamily: "inter_regular",
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    contentView = true;
                  });
                },
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    border: contentView == true
                        ? Border.all(
                            style: BorderStyle.none,
                            color: customGreen,
                          )
                        : Border.all(
                            width: 2,
                            color: customGreen,
                            style: BorderStyle.solid),
                    color: contentView == true ? customGreen : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.list,
                      color: contentView == true ? Colors.white : customGreen,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  setState(() {
                    contentView = false;
                  });
                },
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    border: contentView == false
                        ? Border.all(width: 0, color: customGreen)
                        : Border.all(width: 2, color: customGreen),
                    color: contentView == false ? customGreen : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.grid_view_rounded,
                      color: contentView == false ? Colors.white : customGreen,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: contentView == true
            ? ListViewContent(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              )
            : const GridViewContent(),
      ),
    );
  }
}
