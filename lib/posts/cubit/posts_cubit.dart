import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../model/post_model.dart';
part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  List<PostModel> posts = [];

  void getPosts() async {
    emit(PostsLoadingState());
    try{
      var response =
      await Dio().get("https://jsonplaceholder.typicode.com/posts");
      List json = response.data;
      posts = json.map((e) => PostModel.fromJson(e)).toList();
      emit(PostsSuccessState());
    }catch(e){
      emit(PostsErrorState());
    }

  }
}

//Design Pattern MVVM
// Model - View - View Model
