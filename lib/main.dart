import 'package:flutter/material.dart';
import 'package:flutter_revision_1/note_app/hive_helper.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'ecommerce/splash/splash_screen.dart';
import 'messenger/messenger_screen.dart';
import 'note_app/notes_screen.dart';



void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.notesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesScreen(),
    );
  }
}
