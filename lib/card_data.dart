import 'package:bmi_calculator/const/constant.dart';
import 'package:flutter/material.dart';



class CardData extends StatelessWidget {
  final IconData icon;
  final String label;
  const CardData(
    {super.key, 
      required this.icon,required this.label
    }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
          color: Color(0xff969AB9),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: styletext,
        ),
      ],
    );
  }
}
