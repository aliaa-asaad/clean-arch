import 'package:clean_arch_omran/core/error_handler/failure.dart';
import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/domain/repo/post_repo_entity.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUseCase /* extends UseCase<List<Post>, NoParams> */ {
  final PostRepoEntity repository;

  GetAllPostsUseCase(this.repository);

  
  Future<Either<Failure, List<PostEntities>>> call() async {
    return await repository.getAllPosts();
  }
}