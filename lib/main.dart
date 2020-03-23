import 'package:flutter/material.dart';
import 'package:statuscorona/views/ListaDePaises.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19',
      theme: ThemeData(
        cardColor: Colors.black,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
              title: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          elevation: 0,
          brightness: Brightness.dark,
          color: Colors.black12,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          focusColor: Colors.white,
          hintStyle: TextStyle(color: Colors.white),
          hoverColor: Colors.white,
          counterStyle: TextStyle(color: Colors.white),
          errorStyle: TextStyle(color: Colors.white),
          helperStyle: TextStyle(color: Colors.white),
          prefixStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          suffixStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
