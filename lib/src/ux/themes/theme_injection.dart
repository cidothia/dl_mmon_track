import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

enum ThemeName { pink, blue }

final kPinkishThemeLight = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.pink,
    brightness: Brightness.light,
  ),
);

final kBluishThemeLight = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  ),
);

final kPinkishThemeDark = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.pink,
    brightness: Brightness.dark,
  ),
);

final kBluishThemeDark = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  ),
);

final themeRM = RM.injectTheme(
  themeMode: ThemeMode.system,
  lightThemes: {
    ThemeName.blue: kBluishThemeLight,
    ThemeName.pink: kPinkishThemeLight,
  },
  darkThemes: {
    ThemeName.blue: kBluishThemeDark,
    ThemeName.pink: kPinkishThemeDark,
  },
);
