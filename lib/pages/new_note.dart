import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/controller/noteController.dart';


class NewNote extends StatelessWidget {
  const NewNote({super.key});

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'N E W - N O T E',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          SizedBox(height: 20,),
          TextField(
            controller: noteController.title,
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
            controller: noteController.des,
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
              noteController.postNote();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.orangeAccent.shade200, // Set the background color
            ),
            child: Text("S A V E",
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          )
        ]),
      ),
    );
  }
}
