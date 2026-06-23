import 'package:flutter/material.dart';
import '../controller/note_controller.dart';
import 'package:provider/provider.dart';

class add_Note extends StatelessWidget {

  final titleContext = TextEditingController();
  final contentContext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight(700)
              ),
              controller: titleContext,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter a title...",
                 hintStyle: TextStyle(fontSize: 24)
              ),
              maxLines: 2,
            ),
        
            TextField(
              controller: contentContext,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "write something...",
                hintStyle: TextStyle(fontSize: 16)
              ),
              maxLines: null,
              
              
            )
        
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(999)
        ),
        onPressed: (){

         final title = titleContext.text;
         final content = contentContext.text;

         context.read<NotesViewModel>().addNote(title, content);
         Navigator.pop(context);
        },
        child: Icon(Icons.save),
        ),
    );
  }
}