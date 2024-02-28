part of 'posts_bloc.dart';

////////////////////
///ازاي الافينت والستيت وارثين من الاكويتابل وليه
////////////////
sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class GetPostsEvent extends PostsEvent {
 // const GetPostsEvent();
}
class RefreshPostsEvent extends PostsEvent {
 /*  final int postId;
  const RefreshPostsEvent({required this.postId});
  @override
  List<Object> get props => [postId]; */
}