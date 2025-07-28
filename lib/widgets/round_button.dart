import 'package:flutter/material.dart';

class Roundbutton extends StatelessWidget {
   const Roundbutton({super.key,required this.icon,required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51.0,
        width: 51.0,
      child: RawMaterialButton(
        shape: CircleBorder(),
       constraints:  BoxConstraints(
          
          
          
        ),
        fillColor:  Color.fromARGB(255, 140, 144, 168),
        onPressed: 
          onPressed,
       
        
        child: Icon(icon),
         ),
    );
  }
}