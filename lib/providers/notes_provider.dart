
import 'package:flutter/cupertino.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/api_service.dart';

class NotesProvider with ChangeNotifier {

  bool isLoading = true;
  List <Note> notes = [];

  NotesProvider(){
    fetchNotes();
  }

  void sortNotes(){
    notes.sort((a, b) => b.dateAdded!.compareTo(a.dateAdded!));
  }

  void fetchNotes() async{
    notes = await ApiService.fetchNotes("piyush@gmail.com");
    isLoading = false;
    sortNotes();
    notifyListeners();
  }

  void addNote(Note note){
    notes.add(note);
    sortNotes();
    notifyListeners();
    ApiService.addNote(note);
  }

  void updateNote(Note note){
    int indexOfNote = notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[indexOfNote] = note;
    sortNotes();
    notifyListeners();
    ApiService.updateNote(note);
  }

  void deleteNote(Note note){
    int indexOfNote = notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(indexOfNote);
    sortNotes();
    notifyListeners();
    ApiService.deleteNote(note);
  }

}