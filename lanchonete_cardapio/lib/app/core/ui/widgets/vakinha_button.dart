import 'dart:ffi';

import 'package:flutter/material.dart';

class VakinhaButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double heigth;
  final Color? color;

  const VakinhaButton({Key? key,
  required this.label,this.width,this.heigth=50,this.color,required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold
         ),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(
          ),
          backgroundColor:color
        ),
      ),
    );
  }
}
