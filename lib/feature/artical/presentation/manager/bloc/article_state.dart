import 'package:artical/feature/artical/data/model/article_model.dart';
import 'package:artical/feature/artical/domain/entities/article_entity.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState{}

/// Article State
class ArticleLoading extends ArticleState{}
class ArticleSuccess extends ArticleState{
  ArticleSuccess(this.articleModel);
  List<Article>  articleModel;
}
class ArticleError extends ArticleState{
  ArticleError(this.message);
  String message;
}


