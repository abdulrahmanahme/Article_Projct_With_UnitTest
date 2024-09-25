import 'package:artical/core/server_failure.dart';
import 'package:artical/feature/artical/data/data_source/article_remote_data_sourec.dart';
import 'package:artical/feature/artical/data/model/article_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late ArticleRemoteDataSourceImpl articleRemoteDataSourceImpl;

  setUp(() {
    mockDio = MockDio();
    articleRemoteDataSourceImpl = ArticleRemoteDataSourceImpl(mockDio);
  });
  group('Test article remote data source  ', () {
    test('should return Article model when the response code is 200', () async {
      //Arrange
      //Act
      when(
        () => mockDio.get('https://jsonplaceholder.typicode.com/posts?_page'),
      ).thenAnswer(
        (_) async => Response(
          data: [
            {
              "userId": 1,
              "id": 1,
              "title":
                  "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
              "body":
                  "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
            },
            {
              "userId": 1,
              "id": 2,
              "title": "qui est esse",
              "body":
                  "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
            },
            {
              "userId": 1,
              "id": 3,
              "title":
                  "ea molestias quasi exercitationem repellat qui ipsa sit aut",
              "body":
                  "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
            },
          ],
          statusCode: 200,
          requestOptions: RequestOptions(
              path: 'https://jsonplaceholder.typicode.com/posts?_page'),
        ),
      );

      //Act
      final result = await articleRemoteDataSourceImpl.getAllArticle();

      //Assert
      expect(result, isA<List<ArticleModel>>());
    });

    test('should return status code not equal  200', () async {
      //Arrange

      when(() =>
              mockDio.get('https://jsonplaceholder.typicode.com/posts?_page'))
          .thenThrow(
        () async => Response(
          statusCode: 500,
          requestOptions: RequestOptions(
            path: 'https://jsonplaceholder.typicode.com/posts?_page',
          ),
        ),
      );
      // act
      final result = articleRemoteDataSourceImpl.getAllArticle();
      ///assert
      expect(result, throwsA(isA<Exception>()));
    });
  });
}
