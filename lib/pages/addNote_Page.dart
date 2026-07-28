import 'package:flutter/material.dart';
import 'package:reindeer/viewModel/notes_ViewModel.dart';

class AddnotePage extends StatelessWidget {

  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: IconButton(onPressed: (){
                 /**   addNote(
                      _title.text,
                      _content.text
                      );  */
                      Navigator.pop(context, addNote(
                        _title.text,
                        _content.text
                      ));
                  }, icon: Icon(Icons.check)),
                )
              ],
            ),
            Column(
              children: [
                TextField(
                  controller: _title,
                  decoration: InputDecoration(hintText: 'Enter title'),
                ),
                TextField(
                  controller: _content,
                  decoration: InputDecoration(hintText: 'Enter notes'),
                ),
              
              ],
            ),
          ],
        ),
      ),
    );
  }
}