import 'package:flutter/material.dart';
import 'package:aksara/themes/colors.dart';

class Apptheme{
  static const colors = AppColors();

  const Apptheme._();

  static ThemeData define (){
    return ThemeData(
      primaryColor: Color(0xffF89300),
      // tambah lagi bawah ni scondary etc.
    );
  }
}