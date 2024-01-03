import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sampleproject/models/NoteModel.dart';
import 'package:flutter/material.dart';

class NoteController extends GetxController{

  String url = "https://659440301493b011606a40c2.mockapi.io/note";
  // List for notes
  RxList<NoteModel> notesList = RxList<NoteModel>();

  TextEditingController title = TextEditingController(); // Text controller for new title
  TextEditingController des = TextEditingController(); // Text controller for new description

  TextEditingController titleDetails = TextEditingController(); // Text controller for existing title
  TextEditingController desDetails = TextEditingController(); // Text controller for existing description

  /// Initialization method
  void onInit() async {
    super.onInit();
    getNotes();
  }

  /// Fetch notes from API
  Future<void> getNotes() async {
    var response = await http.get(Uri.parse(url));
    var notes = jsonDecode(response.body);
    notesList.clear();
    for (var note in notes) {
      notesList.add(NoteModel.fromJson(note));
    }
    print("Notes Get");
  }

  /// Post a new note to API
  Future<void> postNote() async{
    var newNote = NoteModel(
      title: title.text,
      description: des.text,
    );
    if (title.text != "" || des.text != "") {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(newNote.toJson()),
          headers: {'content-type': 'application/json'});
      if (response.statusCode == 201) {
        title.clear();
        des.clear();
        print("Note Added");
        getNotes();
        Get.back();
      }
    } else {
      print("Please enter something");
    }
  }

  /// Delete a note from API
  Future<void> deleteNote(String id) async{
    var newUrl = "https://659440301493b011606a40c2.mockapi.io/note/$id";
    final response = await http.delete(Uri.parse(newUrl));
    if (response.statusCode == 200) {
      print("Note Delete");
      getNotes();
      Get.back();
    }
  }

  /// Update an existing note in API
  Future<void> putNote(String id) async{
    var newUrl = "https://659440301493b011606a40c2.mockapi.io/note/$id";
    var updatedNote = NoteModel(
      title: titleDetails.text,
      description: desDetails.text,
    );
    var response = await http.put(Uri.parse(newUrl),
        body: jsonEncode(updatedNote.toJson()),
        headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      print("Note Updated");
      getNotes();
      Get.back();
    }
  }
}
