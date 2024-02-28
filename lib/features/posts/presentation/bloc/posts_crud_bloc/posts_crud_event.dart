part of 'posts_crud_bloc.dart';

sealed class PostsCrudEvent extends Equatable {
  const PostsCrudEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends PostsCrudEvent {
  final PostEntities post;
  const AddPostEvent({required this.post});
  @override
  List<Object> get props => [post];
}

class UpdatePostEvent extends PostsCrudEvent {
  final PostEntities post;
  const UpdatePostEvent({required this.post});
  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends PostsCrudEvent {
  final int postId;
  const DeletePostEvent({required this.postId});
  @override
  List<Object> get props => [postId];
}
