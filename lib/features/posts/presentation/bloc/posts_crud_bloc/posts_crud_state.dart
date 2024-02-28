part of 'posts_crud_bloc.dart';

sealed class PostsCrudState extends Equatable {
  const PostsCrudState();
  
  @override
  List<Object> get props => [];
}

final class PostsCrudInitial extends PostsCrudState {}
class PostsCrudLoading extends PostsCrudState {}
class PostsCrudLoaded extends PostsCrudState {
  final String message;
  const PostsCrudLoaded({required this.message});
  @override
  List<Object> get props => [message];
}
class PostsCrudError extends PostsCrudState {
  final String message;
  const PostsCrudError({required this.message});
  @override
  List<Object> get props => [message];
}
