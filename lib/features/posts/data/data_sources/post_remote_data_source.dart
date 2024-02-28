import 'dart:convert';

import 'package:clean_arch_omran/core/constants/end_points.dart';
import 'package:clean_arch_omran/core/error_handler/exceptions_handler.dart';
import 'package:clean_arch_omran/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

//عملته ابستراكت عشان فرضا اني بستخدم باكدج وليكن الاتش تي تي
// بي بس هي باظت فممكن استخدم الديو مكانها بس مضطرش ادخل جوا اكواد
//الاتش تي تي بي واعمل تعديلات عليها فيهكون الامبليمنتيشن بتاع الكلاس
//فكلاسات منفصلة للديو والاتش تي تي بي بحيث ان لو حاجة باظت متاثرش عالتانية
abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int postId);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> addPosts(PostModel postModel);

  /*  final http.Client client;

  PostRemoteDataSource({required this.client});

  Future<List<PostEntities>> getAllPosts() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> posts = json.decode(response.body);
      return posts.map((e) => PostEntities.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  } */
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(
      Uri.parse(BASE_URL + POSTS),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final List decodedJson = await jsonDecode(response.body) as List;
      final List<PostModel> postModels = decodedJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();

      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPosts(PostModel postModel) async {
    final Map<String, dynamic> body = {
      'title': postModel.title,
      'body': postModel.body,
    };
    final response = await client.post(Uri.parse(BASE_URL + POSTS),
        /* headers: {
          'Content-Type': 'application/json',
        }, */
        body: body // json.encode(postModel.toJson()),
        );
    if (response.statusCode == 201) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    final response = await client.delete(
      Uri.parse('$BASE_URL$POSTS/$postId'),
      /* headers: {
        'Content-Type': 'application/json',
      }, */
    );
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final Map<String, dynamic> body = {
      'title': postModel.title,
      'body': postModel.body,
    };
    final response = await client.put(
        Uri.parse('$BASE_URL$POSTS/${postModel.id}'),
        /*       headers: {
              'Content-Type': 'application/json',
            }, */
        body: body //json.encode(postModel.toJson()),
        );
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }
}
