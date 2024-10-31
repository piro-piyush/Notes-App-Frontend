import 'dart:convert';

List<Note> noteFromJson(String str) => List<Note>.from(json.decode(str).map((x) => Note.fromJson(x)));

String noteToJson(List<Note> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Note {
  String? id;
  String? noteId;
  String? userId;
  String? title;
  String? content;
  DateTime? dateAdded;

  Note({
    this.id,
    this.noteId,
    this.userId,
    this.title,
    this.content,
    this.dateAdded,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json["_id"],
    noteId: json["id"],
    userId: json["userId"],
    title: json["title"],
    content: json["content"],
    dateAdded: json["dateAdded"] == null ? null : DateTime.parse(json["dateAdded"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": noteId,
    "userId": userId,
    "title": title,
    "content": content,
    "dateAdded": dateAdded?.toIso8601String(),
  };
}
