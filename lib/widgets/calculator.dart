import 'dart:math';

class Calculator {
  Calculator({required this.userheight,required this.userweight,});

  final int userheight;
  final int userweight;
   late double bmi;

  String bmicalculate (){
    bmi=userweight/pow(userheight/100, 2);
    return bmi.toStringAsFixed(1);
    
  }

  String getresult(){
    if(bmi>=25){
      return("OVERWEIGHT");

    }
    else if (bmi>18.5){
      return("NORMAL");
    }
    else{
      return("UNDERWEIGHT");
    }
  }
  String resultexplanation(){
    if(bmi>=25){
      return("You are Overweight you should do more Workouts");

    }
    else if (bmi>18.5){
      return("You are Normal body weight.Great job!");
    }
    else{
      return("You are Underweight.You can include more calories in your diet");
    }
  }}