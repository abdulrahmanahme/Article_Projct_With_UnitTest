import 'package:artical/feature/artical/domain/entities/article_entity.dart';

class ArticleModel {
  int userId;
  int id;
  String title;
  String body;

  ArticleModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };

  Article toEntity() {
    return Article(id: userId, userId: userId, title: title, body: body);
  }
}
