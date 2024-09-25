import 'package:artical/core/failure.dart';
import 'package:artical/core/use_case/use_case.dart';
import 'package:artical/feature/artical/domain/entities/article_entity.dart';
import 'package:artical/feature/artical/domain/repository/article_repository.dart';
import 'package:artical/feature/artical/domain/use_cases/article_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockArticleRepository extends Mock implements ArticleRepository {}

void main() {
  late MockArticleRepository mockArticleRepository;
  late ArticleUseCase articleUseCase;
  setUp(() {
    mockArticleRepository = MockArticleRepository();
    articleUseCase = ArticleUseCase(mockArticleRepository);
  });
  group('ArticleUseCase ', () {
    test('should get current Article detail from the repository', () async {
      // Arrange
      var userArticle = List.generate(
        5,
        (int index) => Article(
          id: index,
          userId: index,
          title:
              "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
          body:
              "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
        ),
      );

      ///Act
      when(() => mockArticleRepository.getAllArticle())
          .thenAnswer((_) async => Right(userArticle));

      final result = await articleUseCase.execute(const NoParameter());

      /// Assert
      expect(result, equals(Right(userArticle)));
    });
  });

  test('should return a failure on error', () async {
    // Arrange
    var userArticle = List.generate(
      5,
      (int index) => Article(
        id: index,
        userId: index,
        title:
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        body:
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
      ),
    );

    ///Act
    when(() => mockArticleRepository.getAllArticle()).thenAnswer(
        (_) async => const Left(ServerFailure(message: 'There is no data')));

    final result = await articleUseCase.execute(const NoParameter());

    /// Assert
    expect(result, equals(const Left(ServerFailure(message: 'There is no data'))));
  });
}
