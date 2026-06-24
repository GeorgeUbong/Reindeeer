import 'package:flutter/material.dart';
import 'package:reindeer/views/Home.dart';
import '../controller/note_controller.dart';
import '../Models/note_model.dart';

class Noteview extends StatelessWidget {
  //const Noteview({super.key});

  final Note note;
  const Noteview({super.key, required this.note});

  @override
  Widget build(BuildContext context){
return Scaffold(
appBar: AppBar(title: Text( note.title),),
body: SingleChildScrollView(
  child: Padding(
    padding:
     EdgeInsets.all(16.0),
  child: Column(
    children: [
      Text(note.content)
    ],
  ),),
),
);
  }
}