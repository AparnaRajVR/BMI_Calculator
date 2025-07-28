import 'package:bmi_calculator/const/constant.dart';
import 'package:flutter/material.dart';

class bottombutton extends StatelessWidget {
  const bottombutton({
    super.key,required this.buttonlabbel,required this.onpress
  });
  final String buttonlabbel;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        padding: EdgeInsets.only(bottom:8.0 ),
        width: double.infinity,
        height: 70,
      
        decoration: BoxDecoration(color: containercolor,borderRadius: BorderRadius.circular(4)),
        child: Center(
          child: Text(
            buttonlabbel,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
