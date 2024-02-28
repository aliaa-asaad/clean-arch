import 'package:clean_arch_omran/core/error_handler/exceptions_handler.dart';
import 'package:clean_arch_omran/core/error_handler/failure.dart';
import 'package:clean_arch_omran/core/network/network_info.dart';
import 'package:clean_arch_omran/features/posts/data/data_sources/post_local_data_source.dart';
import 'package:clean_arch_omran/features/posts/data/data_sources/post_remote_data_source.dart';
import 'package:clean_arch_omran/features/posts/data/models/post_model.dart';
import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/domain/repo/post_repo_entity.dart';
import 'package:dartz/dartz.dart';
///////////////
//he used this data type instead of Future<Unit> Function()
//ليه بقي استخدمه يعني حاسة ملوش لازمة
/////////////////////////
typedef Future<Unit> DeleteOrAddOrUpdatePost();
// PostRepoData is a class that implements PostRepoEntity abstract class and 
//it's responsible for handling the data from the remote and local data sources.
class PostRepoData extends PostRepoEntity {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepoData(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<PostEntities>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        //post model is extended from post entities so i can return it as
        // post model when i make the post entities as a right value
        final List<PostModel> remotePosts =
            await remoteDataSource.getAllPosts();
        // to store the data in the local database if i need it in offline mode
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final List<PostModel> localPosts =
            await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCachedException {
        return Left(EmptyCachedFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPosts(PostEntities postEntities) async {
    final PostModel postModel = PostModel(
        id: postEntities.id,
        title: postEntities.title,
        body: postEntities.body);
        //////////////////////
    //ليه معملش السطر اللي تحت بدل اللي فوق
    //final PostModel postModel = postEntities as PostModel;
    ///////////////////////
    return await _getResponse(() => remoteDataSource.addPosts(postModel));
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    
    return await _getResponse(() => remoteDataSource.deletePost(postId));
  }

  @override
  Future<Either<Failure, Unit>> updatePost(PostEntities postEntities) async {
    final PostModel postModel = PostModel(
        id: postEntities.id,
        title: postEntities.title,
        body: postEntities.body);
    return await _getResponse(() => remoteDataSource.updatePost(postModel));
  }

  Future<Either<Failure, Unit>> _getResponse(
      Future<Unit> Function() postFunction) async {
    if (await networkInfo.isConnected) {
      try {
    
        await postFunction();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
      /////////////////
      //ليه هننا مش بستخدم الاكسبشن بتاع الاوفلاين
      /////////////////
    } else {
      return Left(OfflineFailure());
    }
  }
}
