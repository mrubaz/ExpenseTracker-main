import 'package:expensetracker/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../widgets/const.dart';
import '../widgets/custombutton.dart';
import '../widgets/dropdownlist.dart';
import '../widgets/feildcontainer.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _price = TextEditingController();
  var _categorySelected = "Entertainment";
  DateFormat formatter = DateFormat('dd/MM/yyyy');
  String newdate = "";
  DateTime? datePicked;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenwidth * (0.0603)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              screenHeight: screenHeight,
              textForButton: "Save",
            ),
            SizedBox(height: screenHeight * (0.0306)),
          ],
        ),
      ),
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
          "Add Expenses",
          style: TextStyle(
            fontFamily: "inter_regular",
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenwidth * (0.0603)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * (0.03459)),
              const Text(
                "Title",
                style: TextStyle(
                  fontFamily: "inter_semibold",
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 11),
              FeildContainer(
                controllername: _title,
                initialText: "Movie",
                lengthoftext: 18,
                isSpace: false,
                inputType: TextInputType.text,
              ),
              SizedBox(height: screenHeight * (0.0267)),
              const Text(
                "Date",
                style: TextStyle(
                  fontFamily: "inter_semibold",
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 11),
              // Date Picker
              Container(
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
                      controller: _date,
                      readOnly: true,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2222),
                        ).then((date) {
                          setState(() {
                            datePicked = date!;
                            newdate = formatter.format(datePicked!);
                          });
                        });
                      },
                      decoration: InputDecoration(
                        hintText: datePicked == null ? "01/01/2022" : newdate,
                        hintStyle: TextStyle(
                          fontFamily: "inter_regular",
                          fontSize: 18,
                          color: datePicked == null ? lightGrey : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 19),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (0.0267)),
              const Text(
                "Category ID",
                style: TextStyle(
                  fontFamily: "inter_semibold",
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 11),
              // DropDownMenu
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 17),
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
                    DropdownButton<String>(
                      isExpanded: true,
                      items: dropdownMenu.map((String dropdownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropdownStringItem,
                          child: Text(
                            dropdownStringItem,
                            style: const TextStyle(
                              fontFamily: "inter_regular",
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValueSelected) {
                        _onDropDownItemSelected(newValueSelected);
                      },
                      value: _categorySelected,
                      icon: const Icon(Icons.expand_more, color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      underline: const Offstage(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (0.0267)),
              const Text(
                "Price",
                style: TextStyle(
                  fontFamily: "inter_semibold",
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 11),
              FeildContainer(
                controllername: _price,
                initialText: "5000",
                lengthoftext: 18,
                isSpace: true,
                inputType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }

// DropDownItemSelected Function
  void _onDropDownItemSelected(String? newValueSelected) {
    setState(() {
      _categorySelected = newValueSelected.toString();
    });
  }
}
