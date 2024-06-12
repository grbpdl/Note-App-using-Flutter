import 'package:flutter/material.dart';
import 'package:note_application/widget/Card.dart';
import 'helper/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Your Notes",
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    notes = SharedPrefs().notes;
  }

  Future<void> addNotes() async {
    final TextEditingController _textFieldController = TextEditingController();
    String? newNote = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new note'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: "Enter your note here"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ADD'),
              onPressed: () {
                Navigator.of(context).pop(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );

    if (newNote != null && newNote.isNotEmpty) {
      setState(() {
        SharedPrefs().addNote(newNote);
        notes = SharedPrefs().notes;
      });
    }
  }

  void deleteNoteAt(int index) {
    setState(() {
      SharedPrefs().deleteNoteAt(index);
      notes = SharedPrefs().notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: addNotes,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        hoverColor: Colors.green,
        focusColor: Colors.amber,
      ),
      appBar: AppBar(
        title: Text(
          "Write your Notes",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Container(
        width: double.maxFinite,
        color: Colors.blueGrey.shade600,
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return MyCard(
              note: notes[index],
              onDelete: () => deleteNoteAt(index),
            );
          },
        ),
      ),
    );
  }
}
