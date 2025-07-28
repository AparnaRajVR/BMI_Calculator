import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/calculator.dart';
import 'package:bmi_calculator/widgets/card_data.dart';
import 'package:bmi_calculator/const/constant.dart';
import 'package:bmi_calculator/screens/resultpage.dart';
import 'package:bmi_calculator/widgets/custom_appbar.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

int userheight = 180;
int userweight = 50;
int userage = 16;

void changecolor(int gender) {
  if (gender == 1) {
    if (femaleinactivecolor == inactivecardcolor) {
      femaleinactivecolor = activecardcolor;
      maleinactivecolor = inactivecardcolor;
    } else {
      femaleinactivecolor = inactivecardcolor;
    }
  }
  if (gender == 2) {
    if (maleinactivecolor == inactivecardcolor) {
      maleinactivecolor = activecardcolor;
      femaleinactivecolor = inactivecardcolor;
    } else {
      maleinactivecolor = inactivecardcolor;
    }
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

Color femaleinactivecolor = inactivecardcolor;
Color maleinactivecolor = inactivecardcolor;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changecolor(2);
                      });
                    },
                    child: ReusableCard(
                      colour: maleinactivecolor,
                      cardchild: CardData(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changecolor(1);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleinactivecolor,
                      cardchild: CardData(
                        icon: FontAwesomeIcons.venus,
                        label: "Female",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: inactivecardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height", style: styletext),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(userheight.toString(), style: digitstyle),
                      // SizedBox(width: 10),
                      Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff969AB9),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 11.0,
                      ),
                    ),
                    child: Slider(
                      value: userheight.toDouble(),
                      min: 80.0,
                      max: 220.0,
                      activeColor: containercolor,
                      inactiveColor: Color(0xff969AB9),
                      onChanged: (double newserheight) {
                        setState(() {
                          userheight = newserheight.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: inactivecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight", style: styletext),
                        Text(userweight.toString(), style: digitstyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Roundbutton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  userweight--;
                                });
                              },
                            ),

                            SizedBox(width: 10),
                            Roundbutton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  userweight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: inactivecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age", style: styletext),
                        Text(userage.toString(), style: digitstyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundbutton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  userage--;
                                });
                              },
                            ),

                            SizedBox(width: 10),
                            Roundbutton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  userage++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottombutton(
            buttonlabbel: "Calculate BMI",
            onpress: () {
              Calculator calc = Calculator(
                userheight: userheight,
                userweight: userweight,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Resultpage(
                        resultvalue: calc.bmicalculate(),
                        actualresult: calc.getresult(),
                        explanation: calc.resultexplanation(),
                      ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
