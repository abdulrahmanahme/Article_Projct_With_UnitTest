import 'package:artical/feature/artical/data/data_source/article_remote_data_sourec.dart';
import 'package:artical/feature/artical/data/repository/article_data_source_repository.dart';
import 'package:artical/feature/artical/domain/repository/article_repository.dart';
import 'package:artical/feature/artical/domain/use_cases/article_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
 static void init() {
    
    sl.registerLazySingleton<ArticleRemoteDataSource>(
        () => ArticleRemoteDataSourceImpl(Dio()));

    /// ArticleRepository
    sl.registerLazySingleton<ArticleRepository>(
        () => ArticleDataSourceRepository(sl()));
    /// Usa Case
    sl.registerLazySingleton(() => ArticleUseCase(sl()));
  }
}
