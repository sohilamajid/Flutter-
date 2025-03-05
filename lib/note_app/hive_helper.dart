import 'package:hive/hive.dart';

class HiveHelper {
  static const notesBox = "NOTE_BOX";
  static const notesBoxKey = "NOTE_BOX_KEY";
  static var myBox = Hive.box(notesBox);
  static List<String> notesList = [];


  static void addNote(String text) async {
    notesList.add(text);
    await myBox.put(notesBoxKey, notesList);
  }

  static void getNotes(){
    if(myBox.isNotEmpty){
      notesList = myBox.get(notesBoxKey);
    }
  }

  static void removeNote(int index)async{
    notesList.removeAt(index);
    await myBox.put(notesBoxKey, notesList);
  }

  static void removeAllNotes()async{
    notesList.clear();
    await myBox.put(notesBoxKey, notesList);
  }

  static void updateNote(int index , String text )async{
    notesList[index] = text;
    await myBox.put(notesBoxKey, notesList);
  }

}