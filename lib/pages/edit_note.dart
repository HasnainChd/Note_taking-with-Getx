import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/note_controller.dart';

import '../Model/note.dart';

class EditNote extends StatelessWidget {
  final  Note note;

  NoteController noteController = Get.find();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();


  EditNote({super.key, required this.note}) {
    titleController.text = note.title;
    contentController.text = note.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.center,
              maxLines: 5,
              controller: contentController,
              decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                final updateNote = Note(
                    id: note.id,
                    title: titleController.text,
                    content: contentController.text);
                noteController.editNote(updateNote);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Updated successfully')));
                Get.back();
              },
              child: const Text('Edit Note'),
            )
          ],
        ),
      ),
    );
  }
}
