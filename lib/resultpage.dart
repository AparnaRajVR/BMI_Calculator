import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/const/constant.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class Resultpage extends StatelessWidget {
  const Resultpage({
    super.key,
    required this.actualresult,
    required this.resultvalue,
    required this.explanation,
  });
  final String actualresult;
  final String resultvalue;
  final String explanation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text("Your Result", style: titlestyle))),

          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: inactivecardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    actualresult,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(resultvalue, style: digistyle),
                  SizedBox(height: 10),
                  Text(
                    explanation,
                    style: TextStyle(color: Colors.grey, fontSize: 15
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 15),
          bottombutton(
            buttonlabbel: "Calculate Again",
            onpress: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => InputPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
