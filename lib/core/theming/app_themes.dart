import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpt_app/core/theming/colors.dart';


class AppThemes {
  static final lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    scaffoldBackgroundColor: Colors.indigo[300],//ColorsManager.lightTealColor,
    colorScheme: const ColorScheme.light(),

    // appBarTheme: const AppBarTheme(
    //   foregroundColor: Colors.black,
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // ),
  );
  static final darkTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),

    scaffoldBackgroundColor: ColorsManager.grayMedium,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );
}
