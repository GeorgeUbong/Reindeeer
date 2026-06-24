import 'package:flutter/material.dart';
import '../controller/note_controller.dart';
import 'package:provider/provider.dart';

class add_Note extends StatelessWidget {

  final titleContext = TextEditingController();
  final contentContext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF577904),
      appBar: AppBar(title: Text("Add note"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight(700),
                  color: Colors.white
                ),
                controller: titleContext,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter a title...",
                   hintStyle: TextStyle(fontSize: 24, color: Colors.grey.shade300),
                   
                ),
                maxLines: 2,
              ),
          
        
          //Text body
              TextField(
                controller: contentContext,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "write something...",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade300)
                ),
                maxLines: null,
                
                
              )
          
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFFA5B500), Color(0xFF103202) ])
        ),
        child: FloatingActionButton(
          backgroundColor: Color(0xFFA9FE91),
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
          child: Icon(Icons.check),
          ),
      ),
    );
  }
}