import 'package:flutter/material.dart';
import 'package:safe_password_with_hasura/src/utils/mixin/build_material_color_mixin.dart';

class AppTheme with BuildMaterialColor {
  late ThemeData themeDefault = ThemeData(
    primarySwatch: colorToMaterialColor(
      const Color.fromARGB(255, 51, 17, 96),
    ),
    secondaryHeaderColor: colorToMaterialColor(
      const Color.fromARGB(255, 211, 229, 79),
    ),
  );
}
