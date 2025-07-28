import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("BMI Calculator",style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        
      
      ),),
      centerTitle: true,
    );
  }
  
  @override
 
  Size get preferredSize => Size.fromHeight(56);
}