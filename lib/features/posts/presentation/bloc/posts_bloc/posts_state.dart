part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();
  
  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}
class PostsLoading extends PostsState {}
class PostsLoaded extends PostsState {
  final List<PostEntities> posts;
  const PostsLoaded({required this.posts});
  @override
  List<Object> get props => [posts];
}
class PostsError extends PostsState {
  final String message;
  const PostsError({required this.message});
  @override
  List<Object> get props => [message];
}
