import 'package:clean_arch_omran/core/error_handler/failure.dart';
import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/domain/repo/post_repo_entity.dart';
import 'package:dartz/dartz.dart';

class AddPostUseCase {
  final PostRepoEntity repository;

  AddPostUseCase(this.repository);
// don't understand the callable class 
  Future<Either<Failure, Unit>> call(PostEntities postEntities) async {
    return await repository.addPosts(postEntities);
  }
}
