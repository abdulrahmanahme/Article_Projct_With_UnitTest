import 'package:artical/core/failure.dart';
import 'package:artical/feature/artical/data/data_source/article_remote_data_sourec.dart';
import 'package:artical/feature/artical/domain/entities/article_entity.dart';
import 'package:artical/feature/artical/domain/repository/article_repository.dart';
import 'package:dartz/dartz.dart';

class ArticleDataSourceRepository extends ArticleRepository {
  ArticleDataSourceRepository(this.articleRemoteDataSource);
  ArticleRemoteDataSource articleRemoteDataSource;
  @override
  Future<Either<Failure, List<Article>>> getAllArticle() async {
    final result = await articleRemoteDataSource.getAllArticle();
    try {
      return right(result.map((article) => article.toEntity()).toList());
    } on ServerFailure catch (error) {
      return left(
        ServerFailure(message: error.message),
      );
    }
  }
}
