import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
          scaffoldBackgroundColor: Colors.lightBlueAccent.shade100,
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Colors.brown.shade800
            ),
            subtitle1: TextStyle(
              color: Colors.indigo.shade900
            ),
            bodyText1: TextStyle(
              color: Colors.brown
            )
          ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.brown.shade800,
            )
        );
      case ThemeType.Dark:
        return ThemeData(
          scaffoldBackgroundColor: Colors.indigo.shade700,
            textTheme: TextTheme(
                headline3: TextStyle(
                    color: Colors.white
                ),
                subtitle1: TextStyle(
                    color: Colors.yellowAccent
                ),
                bodyText1: TextStyle(
                    color: Colors.greenAccent
                )
            ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigo.shade700,
          )
        );
      case ThemeType.Other:
        return ThemeData(
            scaffoldBackgroundColor: Colors.orange,
            textTheme: TextTheme(
                headline3: TextStyle(
                    color: Colors.black87
                ),
                subtitle1: TextStyle(
                    color: Colors.green[900]
                ),
                bodyText1: TextStyle(
                    color: Colors.deepOrange
                )
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.orange,
            )
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}
