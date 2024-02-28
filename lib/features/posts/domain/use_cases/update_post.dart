import 'package:clean_arch_omran/core/error_handler/failure.dart';
import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/domain/repo/post_repo_entity.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUseCase {
  final PostRepoEntity repository;

  UpdatePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(PostEntities postEntities) async {
    return await repository.updatePost(postEntities);
  }
}
