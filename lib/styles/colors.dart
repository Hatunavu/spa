import 'package:flutter/material.dart';

Color backgroundLogin = const Color(0xFFF4F6FA);
Color primaryColor = const Color(0xff8363D4);
Color colorDone = const Color(0xff39C541);

Gradient mainGradiant = const LinearGradient(
    colors: [Color(0xFF7265E3), Color(0xFF8B63E6)],
    begin: FractionalOffset.topRight,
    end: FractionalOffset.bottomLeft,
    stops: [0.0, 1.0],
    tileMode: TileMode.repeated);

BoxShadow shadowMain = BoxShadow(
    offset: const Offset(0, 10),
    blurRadius: 24,
    color: const Color(0xff7088D2).withOpacity(0.15));
BoxShadow borderShadow = BoxShadow(
    offset: const Offset(0, 4),
    blurRadius: 4,
    color: const Color(0xff323247).withOpacity(0.04));
