import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_revision_1/ecommerce/helper/dio_helper.dart';
import 'package:flutter_revision_1/ecommerce/home/home_screen.dart';
import 'package:flutter_revision_1/ecommerce/login/cubit/login_cubit.dart';
import 'package:flutter_revision_1/ecommerce/login/login_screen.dart';
import 'package:flutter_revision_1/ecommerce/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter_revision_1/note_app/cubit/note_cubit.dart';
import 'package:flutter_revision_1/note_app/hive_helper.dart';
import 'package:flutter_revision_1/posts/cubit/posts_cubit.dart';
import 'package:flutter_revision_1/posts/posts_screen.dart';
import 'package:flutter_revision_1/shop/main_screen.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'ecommerce/splash/splash_screen.dart';
import 'note_app/notes_screen.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.notesBox);
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          PostsCubit()
            ..getPosts(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
