import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final ThemeData theme = ThemeData(
  textTheme: textTheme,
  appBarTheme: appBarTheme,
  cardTheme: cardTheme,
  
);

final ThemeData darkTheme = ThemeData(
 
);

final AppBarTheme appBarTheme = AppBarTheme(
  color: Colors.black12,
  elevation: 10.0
);



final CardTheme cardTheme = CardTheme(
  color: Colors.deepOrange,
  elevation: 10.0,
  margin: EdgeInsets.all(10.0)
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
  color: Colors.black,
  fontFamily: 'WorkSans',
  fontSize: 19.0,
  letterSpacing: 1.2
);

final TextStyle body2 = TextStyle(
  color: Colors.black,
  fontFamily: 'WorkSans',
  fontSize: 19.0,
  letterSpacing: 1.2,
  fontStyle: FontStyle.italic
);

