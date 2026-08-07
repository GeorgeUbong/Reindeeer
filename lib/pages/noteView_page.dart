import 'package:flutter/material.dart';
import 'package:reindeer/pages/editNote_page.dart';
import 'package:reindeer/pages/home_Page.dart';
import 'package:reindeer/viewModel/noteViewModel.dart';
//import 'home_page.dart';
import '../model/note_Model.dart';
//import '../viewModel/notes_ViewModel.dart';
//import '../service/hiveService.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import '../model/note_Model.dart';

class NoteviewPage extends StatelessWidget {
  final Note note;
  final NoteList viewModel;

  NoteviewPage({super.key, required this.note, required this.viewModel});

  @override
  //final note = notes.firstWhere((n) => n.id == noteId);
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final updatedNote = viewModel.notes.firstWhere((n) => n.id == note.id);

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          "Created at ${note.createdAt.day}/${note.createdAt.month}/${note.createdAt.year}",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Updated at ${note.updatedAt.hour}:${note.updatedAt.day}:${note.updatedAt.month}:${note.updatedAt.year}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          tooltip: 'go back',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),

                      /** CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        notifier.deleteNote(note.id);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ), */
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          tooltip: 'options',
                          onPressed: () {
                            showNoteActions(context, note);
                          },
                          icon: Icon(Icons.more_vert),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            updatedNote.title,
                            /**updatedNote.title.isNotEmpty == true
                            ? updatedNote.title!
                            : 'No title added...', */
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              letterSpacing: -0.5,
                            ),
                          ),
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              updatedNote.content,
                              style: TextStyle(
                                fontSize: 20,
                                color: const Color.fromARGB(136, 32, 31, 31),
                                height: 1.2,
                                letterSpacing: 1.2,
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
      },
    );
  }
}

//bottomsheet
void showNoteActions(BuildContext context, Note note) {
  final NoteList viewModel = NoteList();

  final index = viewModel.notes.toList().indexWhere((n) => n.id == note.id);

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Note Actions",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit Note"),
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            EditNotePage(note: note, viewModel: viewModel),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.delete),
                  label: const Text("Delete Note"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    await viewModel.deleteNote(note.id);

                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => homePage()),
                    ); // Close NoteViewPage
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
