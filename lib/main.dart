//start ing the reindeer aplication again for v2
import 'package:flutter/material.dart';
import 'screens/startPage_screen.dart';
//import '';

void main (){
  runApp(
    MyApp()
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //defining the light and dark modes
        //also choos e a color scheme for the app to use!
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light
          )

      ),
      home: StartScreen(),
    );
  }
}