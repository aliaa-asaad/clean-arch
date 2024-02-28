import 'package:clean_arch_omran/core/error_handler/failure.dart';
import 'package:clean_arch_omran/features/posts/domain/repo/post_repo_entity.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase {
  final PostRepoEntity repository;

  DeletePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}
