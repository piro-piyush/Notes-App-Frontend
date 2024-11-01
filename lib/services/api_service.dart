import 'dart:convert';
import 'dart:developer';
import 'package:notes_app/models/note_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _baseUrl = "https://notes-app-backend-0fmm.onrender.com/notes";

  static Future<List<Note>> fetchNotes(String userId) async {
    Uri requestUri = Uri.parse("$_baseUrl/list");
    var response = await http.post(requestUri, body: { "userId": userId });
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
    List<Note> notes = [];
    for(var noteMap in decoded) {
      Note newNote = Note.fromMap(noteMap);
      notes.add(newNote);
    }
    return notes;
  }

  static Future<void> addNote(Note note) async {
    Uri requestUri = Uri.parse("$_baseUrl/add");
    var response = await http.post(requestUri, body:note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> updateNote(Note note) async {
    Uri requestUri = Uri.parse("$_baseUrl/add");
    var response = await http.post(requestUri, body:note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> deleteNote(Note note) async {
    Uri requestUri = Uri.parse("$_baseUrl/delete");
    var response = await http.post(requestUri, body:note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

}