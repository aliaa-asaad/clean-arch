import 'package:bloc/bloc.dart';
import 'package:clean_arch_omran/core/constants/failure_messages.dart';
import 'package:clean_arch_omran/core/constants/success_messages.dart';
import 'package:clean_arch_omran/core/error_handler/failure.dart';
import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/domain/use_cases/add_post.dart';
import 'package:clean_arch_omran/features/posts/domain/use_cases/delete_post.dart';
import 'package:clean_arch_omran/features/posts/domain/use_cases/update_post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'posts_crud_event.dart';
part 'posts_crud_state.dart';

class PostsCrudBloc extends Bloc<PostsCrudEvent, PostsCrudState> {
  
   final AddPostUseCase addPost;
  final DeletePostUseCase deletePost;
  final UpdatePostUseCase updatePost;
  PostsCrudBloc({required this.addPost,
      required this.deletePost,
      required this.updatePost}) : super(PostsCrudInitial()) {
    on<PostsCrudEvent>((event, emit) async{
        if (event is AddPostEvent) {
        emit(PostsCrudLoading());

        final result = await addPost(event.post);

        emit(
          _eitherDoneMessageOrErrorState(
              result, ADD_SUCCESS_MESSAGE),
        );
      } else if (event is UpdatePostEvent) {
        emit(PostsCrudLoading());

        final result = await updatePost(event.post);

        emit(
          _eitherDoneMessageOrErrorState(
              result, UPDATE_SUCCESS_MESSAGE),
        );
      } else if (event is DeletePostEvent) {
        emit(PostsCrudLoading());

        final result = await deletePost(event.postId);

        emit(
          _eitherDoneMessageOrErrorState(
              result, DELETE_SUCCESS_MESSAGE),
        );
      }
    });
  }
 
 

  PostsCrudState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => PostsCrudError(
        message: _mapFailureToMessage(failure),
      ),
      (_) =>PostsCrudLoaded(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
