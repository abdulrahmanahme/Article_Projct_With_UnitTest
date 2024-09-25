import 'package:artical/core/failure.dart';
import 'package:artical/core/use_case/use_case.dart';
import 'package:artical/feature/artical/domain/entities/article_entity.dart';
import 'package:artical/feature/artical/domain/repository/article_repository.dart';
import 'package:dartz/dartz.dart';

class ArticleUseCase extends UseCase<List<Article>, NoParameter> {
  ArticleUseCase(this.articleRepository);
  ArticleRepository articleRepository;

  @override
  Future<Either<Failure, List<Article>>> execute(NoParameter parameter) async {
    return await articleRepository.getAllArticle();
  }
}
