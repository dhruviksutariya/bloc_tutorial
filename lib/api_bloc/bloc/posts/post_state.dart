import 'package:bloc_tutorial/api_bloc/model/Post_model.dart';
import 'package:bloc_tutorial/api_bloc/util/enums.dart';
import 'package:equatable/equatable.dart';

class PostStates extends Equatable {
  final PostSatus postSatus;
  final List<PostModel> postList;
  final List<PostModel> temPostList;
  final String messege;
  final String searchmessege;

  PostStates({
    this.postSatus = PostSatus.loading,
    this.postList = const <PostModel>[],
    this.temPostList = const <PostModel>[],
    this.messege = '',
    this.searchmessege = '',
  });

  PostStates copyWith({
    PostSatus? postSatus,
    List<PostModel>? postList,
    String? messege,
    List<PostModel>? tempostList,
    String? searchmessege,
  }) {
    return PostStates(
      postSatus: postSatus ?? this.postSatus,
      postList: postList ?? this.postList,
      temPostList: tempostList ?? this.temPostList,
      messege: messege ?? this.messege,
      searchmessege: searchmessege ?? this.searchmessege,
    );
  }

  @override
  List<Object?> get props => [
    postSatus,
    postList,
    messege,
    temPostList,
    searchmessege,
  ];
}
