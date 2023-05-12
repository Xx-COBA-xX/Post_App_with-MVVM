import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm2/model/post_model.dart';
import 'package:mvvm2/repo/post_repo.dart';

class PostApi implements PostRepository {
  @override
  Future<List<PostModel>> getAllPost() async {
    Dio dio = Dio();
    List<PostModel> result = [];
    try {
      var response =
          await dio.get("https://jsonplaceholder.typicode.com/posts");
      var list = response.data as List;

      result = list.map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return result;
  }
}
