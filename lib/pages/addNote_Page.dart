import 'package:flutter/material.dart';
import 'package:reindeer/pages/home_Page.dart';
import 'package:reindeer/viewModel/notes_ViewModel.dart';

class AddnotePage extends StatelessWidget {

  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  final listModel notifier;

  AddnotePage({
    super.key,
    required this.notifier
    });

  @override
  Widget build(BuildContext context) {

   // final listModel notifier = listModel();

    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: IconButton(onPressed: (){
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => homePage())
                    );
                  }, icon:Icon(Icons.arrow_back)),
                ),

                CircleAvatar(
                  child: IconButton(onPressed: (){
                  notifier.addNote(
                      _title.text,
                      _content.text
                      );  Navigator.pop(context);
                  }, icon: Icon(Icons.check)),
                ),

               
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