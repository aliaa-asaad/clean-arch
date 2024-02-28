import 'package:clean_arch_omran/core/network/network_info.dart';
import 'package:clean_arch_omran/features/posts/data/data_sources/post_local_data_source.dart';
import 'package:clean_arch_omran/features/posts/data/data_sources/post_remote_data_source.dart';
import 'package:clean_arch_omran/features/posts/data/repos/post_repo_data.dart';
import 'package:clean_arch_omran/features/posts/domain/repo/post_repo_entity.dart';
import 'package:clean_arch_omran/features/posts/domain/use_cases/add_post.dart';
import 'package:clean_arch_omran/features/posts/domain/use_cases/delete_post.dart';
import 'package:clean_arch_omran/features/posts/domain/use_cases/get_all_posts.dart';
import 'package:clean_arch_omran/features/posts/domain/use_cases/update_post.dart';
import 'package:clean_arch_omran/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:clean_arch_omran/features/posts/presentation/bloc/posts_crud_bloc/posts_crud_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => PostsBloc(getAllPostsUseCase: sl()));
  sl.registerFactory(() => PostsCrudBloc(
      addPost: sl(), updatePost: sl(), deletePost: sl()));

// Usecases

  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));

// Repository

  sl.registerLazySingleton<PostRepoEntity>(() => PostRepoData(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker:sl()));

//! External


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}