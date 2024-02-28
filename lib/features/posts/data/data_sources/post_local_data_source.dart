import 'dart:convert';

import 'package:clean_arch_omran/core/constants/end_points.dart';
import 'package:clean_arch_omran/core/error_handler/exceptions_handler.dart';
import 'package:clean_arch_omran/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

//عملته ابستراكت عشان فرضا اني بستخدم باكدج وليكن الاتش تي تي
// بي بس هي باظت فممكن استخدم الديو مكانها بس مضطرش ادخل جوا اكواد
//الاتش تي تي بي واعمل تعديلات عليها فيهكون الامبليمنتيشن بتاع الكلاس
//فكلاسات منفصلة للديو والاتش تي تي بي بحيث ان لو حاجة باظت متاثرش عالتانية
abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> post);

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


class PostLocalDataSourceImpl implements PostLocalDataSource {
final  SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<PostModel> post) {
    // need to convert the post model to map so i can store it in the local database asjson
    List<Map<String, dynamic>> postModelToMap =
        post.map((postModel) => postModel.toJson()).toList();
      //  sharedPreferences=await SharedPreferences.getInstance();
    //sharedPreferences.setStringList('post', postModelToMap.map((e) => e.toString()).toList());

    //////////////////////////
    //هو ليه بيعمل انكود للماب مش هي كدا تعتبر جيسون عادي والمفروض الانكود جيسون هتحول اي اوبجكت لجيسون طب ما هو جيسون
    //وليه مستخدمش السطر اللي فوق بدل الطريقة دي ولا عشان هو اوبجكت فهيتحول
    // لماب انما السطر اللي فوقه هيحوله لليست من الاسترينجات مش فاهمة

    //
    ////////////////////
    sharedPreferences.setString(CACHED_POSTS, /* jsonEncode(postModelToMap) */json.encode(postModelToMap));
    return Future.value(unit);
  
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
     // final List<dynamic> postModelToMap = json.decode(jsonString);
      final List<PostModel> postModelToMap = (jsonDecode(jsonString) as List)
          .map((postJson) => PostModel.fromJson(postJson))
          .toList();
          return Future.value(postModelToMap);
      /* final List<Map<String, dynamic>> postModelToMap =
          (jsonDecode(jsonString) as List)
              .map((e) => Map<String, dynamic>.from(e))
              .toList();
      return Future.value(
          postModelToMap.map((e) => PostModel.fromJson(e)).toList()); */
    } else {
      throw EmptyCachedException();
    }
   
  }
}
