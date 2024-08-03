import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/note_controller.dart';

import '../Model/note.dart';

class AddNote extends StatelessWidget {
  AddNote({
    super.key,
  });

  NoteController noteController = Get.find();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 5,
              textAlign: TextAlign.center,
              controller: contentController,
              decoration: InputDecoration(
                  hintText: 'Content',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  final note = Note(
                      id: DateTime
                          .now()
                          .millisecondsSinceEpoch,
                      title: titleController.text,
                      content: contentController.text);
                  if (titleController.text.isEmpty ||
                      contentController.text.isEmpty) {
                     ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('note can\'t be empty')));
                  } else {
                    noteController.addNote(note);
                    Get.back();
                  }
                },
                child: const Text('Add Note'),)
          ],
        ),
      ),
    );
  }
}
