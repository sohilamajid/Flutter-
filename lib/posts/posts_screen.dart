import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_revision_1/posts/cubit/posts_cubit.dart';


class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.withOpacity(.5),),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          final cubit = context.read<PostsCubit>();
          if(state is PostsLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else if (state is PostsErrorState){
            return Center(child: Text("ERROR",style: TextStyle(
              fontSize: 40,
            ),),);
          }
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: cubit.posts.length,
              itemBuilder: (context, index) =>
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(cubit.posts[index].title ?? ""),
                          Text(cubit.posts[index].userId.toString()),
                        ],
                      ),
                    ),
                  ));
        },
      ),
    );
  }

}
