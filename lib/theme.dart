import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  textTheme: textTheme,
  appBarTheme: appBarTheme,
);

final TextTheme textTheme = TextTheme(
  body1: body1,
  body2: body2,
  caption: caption,
);

final TextStyle caption = TextStyle(
  color: Colors.white,
  fontFamily: 'WorkSans',
  fontSize: 13.0,
  letterSpacing: 1.2
);

final TextStyle body1 = TextStyle(
  color: Colors.white,
  fontFamily: 'WorkSans',
  fontSize: 19.0,
  letterSpacing: 1.2
);

final TextStyle body2 = TextStyle(
  color: Colors.white,
  fontFamily: 'WorkSans',
  fontSize: 19.0,
  letterSpacing: 1.2,
  fontStyle: FontStyle.italic
);

final AppBarTheme appBarTheme = AppBarTheme(
  color: Colors.black12,
  elevation: 10.0
);