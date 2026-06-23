import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reindeer/views/Signup.dart';
import 'controller/note_controller.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (_) => NotesViewModel(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Onboard(),
    );
  }
}

