import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/api_bloc/bloc/posts/post_event.dart';
import 'package:bloc_tutorial/api_bloc/bloc/posts/post_state.dart';
import 'package:bloc_tutorial/api_bloc/model/Post_model.dart';
import 'package:bloc_tutorial/api_bloc/repository/post-repository.dart';
import 'package:bloc_tutorial/api_bloc/util/enums.dart';
import 'package:meta/meta.dart';

class PostBloc extends Bloc<PostsEvent, PostStates> {
  PostRepository postRepository = PostRepository();
  List<PostModel> temPostList = [];

  PostBloc() : super(PostStates()) {
    on<PostFetched>(fetchPostApi);
    on<SearchItem>(_filterList);
  }

  Future<void> _filterList(SearchItem event, Emitter<PostStates> emit) async {

    if(event.stSearch.isEmpty){
      emit(state.copyWith(tempostList: [],searchmessege: ''));
    }else{
      temPostList = state.postList.where((element) => element.email.toString().toLowerCase().contains(event.stSearch.toLowerCase())).toList();
      if(temPostList.isEmpty){
        emit(state.copyWith(tempostList: temPostList ,searchmessege: 'No Data Found'));
      }else{
        emit(state.copyWith(tempostList: temPostList,searchmessege: ''));
      }
    }
    //emit(state.copyWith(tempostList: temPostList));
  }

  Future<void> fetchPostApi(PostFetched event, Emitter<PostStates> emit) async {
    await postRepository
        .fetchPost()
        .then((value) {
      emit(
        state.copyWith(
          postSatus: PostSatus.success,
          messege: 'success',
          postList: value,
        ),
      );
    })
        .onError((error, stackTrace) {
      emit(
        state.copyWith(
          postSatus: PostSatus.failure,
          messege: error.toString(),
        ),
      );
    });
  }
}
