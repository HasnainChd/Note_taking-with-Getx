import 'package:flutter/material.dart';

import '../Model/note.dart';

class ViewNote extends StatelessWidget {
  final Note note;

  const ViewNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                note.content,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
