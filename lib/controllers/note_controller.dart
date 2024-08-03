import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Model/note.dart';

class NoteController extends ChangeNotifier{
  var  noteList =<Note>[].obs;

  void addNote(Note note){
    noteList.add(note);
    notifyListeners();
  }

  void removeNote(int id){
    noteList.removeWhere((note)=> note.id==id);
    notifyListeners();
  }

  void editNote(Note note){
    var index = noteList.indexWhere((n)=> n.id==note.id);
    if(index!=-1){
      noteList[index]=note;
    }
  }

  Note? getNoteById(int id){
    return noteList.firstWhereOrNull((note)=> note.id==id);
  }
}