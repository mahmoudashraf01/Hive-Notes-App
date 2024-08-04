import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff62FCD7);
const Color perple = Colors.deepPurple;
const Color blue = Colors.blue;
Color orange = Colors.orange.shade700;
const Color black = Colors.black;
const Color black2 = Color.fromARGB(255, 44, 44, 44);
const Color black3 = Color.fromARGB(255, 56, 56, 56);
const Color white = Colors.white;
const Color transparent = Colors.transparent;
const kNotesBox = 'notes_box';
List<Color> kColors = const [
  Color(0xff111110),
  Color(0xff181815),
  Color(0xff1f1f1c),
  black2,
  black3,
];


final List<LinearGradient> gradients = [
  const LinearGradient(
    colors: [Colors.red, Colors.orange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  const LinearGradient(
    colors: [Colors.yellow, Colors.green],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  // Add more gradients with different colors and stops
];
