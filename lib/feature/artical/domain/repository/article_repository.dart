import 'package:artical/core/failure.dart';
import 'package:artical/feature/artical/domain/entities/article_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class ArticleRepository {
  Future<Either<Failure,List<Article>>>getAllArticle();
}