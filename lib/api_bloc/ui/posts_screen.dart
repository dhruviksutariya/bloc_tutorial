import 'package:bloc_tutorial/api_bloc/bloc/posts/post_bloc.dart';
import 'package:bloc_tutorial/api_bloc/bloc/posts/post_event.dart';
import 'package:bloc_tutorial/api_bloc/bloc/posts/post_state.dart';
import 'package:bloc_tutorial/api_bloc/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Apis')),
      body: BlocBuilder<PostBloc, PostStates>(
        builder: (context, state) {
          switch (state.postSatus) {
            case PostSatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostSatus.failure:
              return Text(state.messege.toString());
            case PostSatus.success:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search with email ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onChanged: (filterKey) {
                        context.read<PostBloc>().add(SearchItem(filterKey));
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: state.searchmessege.isNotEmpty ? Center(child: Text(state.searchmessege.toString())) :ListView.builder(
                      itemCount:
                          state.temPostList.isEmpty
                              ? state.postList.length
                              : state.temPostList.length,
                      itemBuilder: (context, index) {

                        if(state.temPostList.isNotEmpty){
                          final item = state.temPostList[index];
                          return Card(
                            child: ListTile(
                              title: Text(item.email.toString()),
                               subtitle: Text(item.body.toString()),
                            ),
                          );
                        }else{
                          final item = state.postList[index];
                          return Card(
                            child: ListTile(
                              title: Text(item.email.toString()),
                              subtitle: Text(item.body.toString()),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}

//learning
