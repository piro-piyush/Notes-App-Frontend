
import 'package:flutter/cupertino.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/api_service.dart';

class NotesProvider with ChangeNotifier {

  bool isLoading = true;
  List <Note> notes = [];

  NotesProvider(){
    fetchNotes();
    notifyListeners();
  }

  void fetchNotes() async{
    List<Note> fetchedNotes = await ApiService.fetchNotes("piyush@gmail.com");
    isLoading = false;
    notifyListeners();
  }

  void addNote(Note note){
    notes.add(note);
    notifyListeners();
    ApiService.addNote(note);
  }

  void updateNote(Note note){
    int indexOfNote = notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[indexOfNote] = note;
    notifyListeners();
    ApiService.updateNote(note);
  }

  void deleteNote(Note note){
    int indexOfNote = notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(indexOfNote);
    notifyListeners();
    ApiService.deleteNote(note);
  }

}