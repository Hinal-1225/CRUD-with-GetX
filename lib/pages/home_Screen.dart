import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/noteController.dart';
import 'new_note.dart';
import 'note_widget.dart';
import 'package:sampleproject/models/NoteModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Controller instantiation
    NoteController noteController = Get.put(NoteController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('N O T E S', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Get.to(const NewNote());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // Reactive GridView
        child: Obx(() => GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // Map notes to widgets
          children: noteController.notesList.map((e) => NoteWidgets(note: e,)).toList(),
        ),),
      ),

    );
  }
}
