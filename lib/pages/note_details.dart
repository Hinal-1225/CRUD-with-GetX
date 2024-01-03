import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/controller/noteController.dart';
import 'package:sampleproject/models/NoteModel.dart';

class NotesDetails extends StatelessWidget {
  final NoteModel note;
  const NotesDetails({super.key, required this.note});

  @override
  Widget build(BuildContext context) {

    NoteController noteController = Get.put(NoteController());
    noteController.titleDetails.text = note.title.toString();
    noteController.desDetails.text = note.description.toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'N O T E',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print(note.id);
              noteController.deleteNote(note.id!);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          SizedBox(height: 20,),
          TextField(
            controller: noteController.titleDetails,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.orangeAccent.shade100,
              hintText: "Title",
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: noteController.desDetails,
            maxLines: 4,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.orangeAccent.shade100,
              hintText: "Description",
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              noteController.putNote(note.id!);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.orangeAccent.shade200, // Set the background color
            ),
            child: Text("UPDATE NOTE", style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),),
        ]),
      ),
    );
  }
}
