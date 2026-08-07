import 'package:flutter/material.dart';
import 'pages/start_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './model/note_Model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize
  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());

  //expose notes db
  await Hive.openBox<Note>("notes");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: StartPage(),
    );
  }
}
