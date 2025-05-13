import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchItem extends PostsEvent {
  final String stSearch;

  SearchItem(this.stSearch);
}

class PostFetched extends PostsEvent {}
