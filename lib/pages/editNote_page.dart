import 'package:flutter/material.dart';
import 'package:reindeer/viewModel/noteViewModel.dart';
//import 'package:reindeer/pages/home_page.dart';
//import 'package:reindeer/viewModel/notes_ViewModel.dart';
import '../model/note_Model.dart';
//import '../service/hiveService.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EditNotePage extends StatelessWidget {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  final NoteList viewModel;
  final Note note;

  EditNotePage({super.key, required this.viewModel, required this.note});

  @override
  Widget build(BuildContext context) {
    // final listModel notifier = listModel();
    //final box = Hive.box<Note>("notes");

    final index = viewModel.notes.toList().indexWhere((n) => n.id == note.id);

    return Scaffold(
      backgroundColor: Color(0xfff577904),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xfffe0cdb7),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),

                  CircleAvatar(
                    child: IconButton(
                      onPressed: () async {
                        await viewModel.updateNote(
                          note.id,
                          _title.text,
                          _content.text,
                        );
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.check),
                    ),
                  ),
                ],
              ),

              //body
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        controller: _title,
                        decoration: InputDecoration(
                          hintText: note.title,
                          hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 218, 218, 218),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        controller: _content,
                        decoration: InputDecoration(
                          hintText: note.content,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 218, 218, 218),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
