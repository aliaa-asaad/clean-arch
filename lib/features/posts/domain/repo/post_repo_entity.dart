import 'package:clean_arch_omran/core/error_handler/failure.dart';
import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:dartz/dartz.dart';

// PostRepoEntity is an abstract class because it's common between data layer and domain layer so, i'll implement this class in data layer.
abstract class PostRepoEntity {
  //الفاليير عبارة عن كلاس انا بكريته بهندل فيه الايرورز وغيره
  // failure is a class that represents a value that carries error information inside it.
  Future<Either<Failure, List<PostEntities>>> getAllPosts();
  //اليونت بديل للفويد يعني الفانكشن مش هترجعلي حاجة
  // unit is a type that represents a value that carries no information and is instead of void type.
  Future<Either<Failure, Unit>> deletePost(int postId);
  Future<Either<Failure, Unit>> updatePost(PostEntities postEntities);
  Future<Either<Failure, Unit>> addPosts(PostEntities postEntities);
}
