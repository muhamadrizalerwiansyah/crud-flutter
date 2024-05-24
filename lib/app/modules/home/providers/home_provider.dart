import 'package:dio/dio.dart' as d;
import 'package:dio/dio.dart';

class HomeProvider {
  final dio = d.Dio();

  Future<dynamic?> save(String title, String desc) async {
    try {
      final response =
          await dio.post("https://jsonplaceholder.typicode.com/posts", data: {
        "title": title,
        "body": desc,
      });
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<dynamic?> update(int id, String title, String desc) async {
    try {
      final response = await dio
          .put("https://jsonplaceholder.typicode.com/posts/$id", data: {
        "title": title,
        "body": desc,
      });
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<dynamic?> getData() async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/posts");
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<dynamic?> deleteData(int id) async {
    try {
      final response =
          await dio.delete("https://jsonplaceholder.typicode.com/posts/$id");
      return response;
    } on DioError catch (e) {
      return null;
    }
  }
}
