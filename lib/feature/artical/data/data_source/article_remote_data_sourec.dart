import 'package:artical/core/networking/error_message_model.dart';
import 'package:artical/core/server_failure.dart';
import 'package:artical/feature/artical/data/model/article_model.dart';
import 'package:dio/dio.dart';

abstract class ArticleRemoteDataSource {
  Future<List<ArticleModel>> getAllArticle();
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  ArticleRemoteDataSourceImpl(this._dio);
  final Dio _dio;
  @override
  Future<List<ArticleModel>> getAllArticle() async {
    try {
      var response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts?_page');
      if (response.statusCode == 200) {
        return (response.data as List<dynamic>)
            .map((json) => ArticleModel.fromJson(json))
            .toList();
      } else {
        throw ServerExtension(errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } catch (error) {
      throw Exception('There was an error: $error');
    }

  }
}
