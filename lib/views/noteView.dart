import 'package:flutter/material.dart';
import 'package:reindeer/views/Home.dart';
import '../controller/note_controller.dart';
import 'package:provider/provider.dart';
import '../Models/note_model.dart';

class Noteview extends StatelessWidget {
  //const Noteview({super.key});

  final Note note;
  const Noteview({super.key, required this.note});

  @override
  Widget build(BuildContext context){
return Scaffold(
appBar: AppBar(title: Text( note.title),),
resizeToAvoidBottomInset: true,
body: Padding(padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
child: SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(note.content),
  
    //  Spacer(),
      Row(
        children: [
          Text(
            note.createdAt.toString().substring(10, 19)
            ),
            Spacer(),
  
            IconButton(
              onPressed: (){
              context.read<NotesViewModel>().deleteNote(note.id);
  
              Navigator.pop(context); //go back
            }, 
            icon: Icon(Icons.delete, color: Colors.red,))
  
            
        ],
      ),
      SizedBox(
              height: 18.0,
            ),
    ],
  ),
),),
);
  }
}