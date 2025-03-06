import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_revision_1/note_app/cubit/note_cubit.dart';
import 'package:flutter_revision_1/note_app/hive_helper.dart';
import 'package:flutter_revision_1/posts/cubit/posts_cubit.dart';
import 'package:flutter_revision_1/posts/posts_screen.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'ecommerce/splash/splash_screen.dart';
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
    return BlocProvider(
      create: (context) => PostsCubit()..getPosts(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostsScreen(),
      ),
    );
  }
}
