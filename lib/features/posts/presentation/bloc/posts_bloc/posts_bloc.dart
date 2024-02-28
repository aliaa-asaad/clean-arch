import 'package:bloc/bloc.dart';
import 'package:clean_arch_omran/core/constants/failure_messages.dart';
import 'package:clean_arch_omran/core/error_handler/failure.dart';
import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/domain/use_cases/get_all_posts.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  /////////////////////
  ///ليه عمل افينتين والاتننين هيرجعوا نفس الحاجة اصلا
  ////////////////////
  final GetAllPostsUseCase getAllPostsUseCase;
  PostsBloc({required this.getAllPostsUseCase}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetPostsEvent) {
        emit(PostsLoading());
        ////////////////
        ///ازاي الاوبجكت مكتوب زي الميثود
        ////////////////
        final result = await getAllPostsUseCase();
        emit(_mapFailureOrPostsToState(result));
      } else if (event is RefreshPostsEvent) {
        emit(PostsLoading());

        final result = await getAllPostsUseCase();
        emit(_mapFailureOrPostsToState(result));
      }
    });
  }
  PostsState _mapFailureOrPostsToState(
      Either<Failure, List<PostEntities>> either) {
    return either.fold(
      (failure) => PostsError(message: _mapFailureToMessage(failure)),
      (posts) => PostsLoaded(
        posts: posts,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCachedFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
