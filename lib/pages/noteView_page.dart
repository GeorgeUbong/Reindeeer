import 'package:flutter/material.dart';
import 'package:reindeer/pages/editNote_page.dart';
import 'home_page.dart';
import '../model/note_Model.dart';
import '../viewModel/notes_ViewModel.dart';

class NoteviewPage extends StatelessWidget {
  final Note note;
  final listModel notifier;

  const NoteviewPage({super.key, required this.note, required this.notifier});

  @override
  //final note = notes.firstWhere((n) => n.id == noteId);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.symmetric(vertical: 10),
                child: Text(note.createdAt.toString().substring(0, 19)),
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
                    child: IconButton(
                      tooltip: 'options',
                      onPressed: () {
                        slideUp(context, note, notifier);
                      },
                      icon: Icon(Icons.more_vert),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    /**note.title.isNotEmpty == true
                        ? note.title!
                        : 'No title added...', */
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text(
                    note.content,
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(136, 32, 31, 31),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//bottomsheet
void slideUp(BuildContext context, Note note, listModel notifier) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) => Container(
      width: 300,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),

      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditNotePage(notifier: notifier, note: note),
                ),
              );
            },
            child: Text('Edit Note'),
          ),
          //edit
          ElevatedButton(
            onPressed: () {
              notifier.deleteNote(note.id);
              Navigator.pop(
                context,
                MaterialPageRoute(builder: ((context) => homePage())),
              );
            },
            child: Text('Delete Note'),
          ),
        ],
      ),
    ),
  );
}
