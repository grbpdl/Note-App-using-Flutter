import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;

  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  List<String> get notes {
    String? notesJson = _sharedPrefs.getString("notes");
    if (notesJson == null) return [];
    List<dynamic> notesList = jsonDecode(notesJson);
    return notesList.cast<String>();
  }

  set notes(List<String> value) {
    String notesJson = jsonEncode(value);
    _sharedPrefs.setString("notes", notesJson);
  }

  void deleteNoteAt(int index) {
    List<String> currentNotes = notes;
    if (index >= 0 && index < currentNotes.length) {
      currentNotes.removeAt(index);
      notes = currentNotes;
    }
  }

  void addNote(String note) {
    List<String> currentNotes = notes;
    currentNotes.add(note);
    notes = currentNotes;
  }
}
