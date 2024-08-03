import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/note_controller.dart';
import 'package:note_app/pages/edit_note.dart';
import 'package:note_app/pages/view_note.dart';

import 'add_note.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Obx(
          () => ListView.builder(
            itemCount: noteController.noteList.length,
            itemBuilder: (context, int index) {
              final note = noteController.noteList[index];
              return ListTile(
                onTap: () {
                  Get.to(ViewNote(note: note));
                },
                leading: IconButton(
                  onPressed: () {
                    noteController.removeNote(note.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                            content: Text('Deleted successfully')));
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 28,
                  ),
                ),
                title: Text(
                  textAlign: TextAlign.center,
                  note.title,
                  style: const TextStyle(fontSize: 22),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Get.to(() => EditNote(
                          note: note,
                        ));
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: 28,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNote());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
