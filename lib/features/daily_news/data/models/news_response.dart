import 'dart:convert';

import 'package:news_app_clean_architecture/features/daily_news/data/models/article.dart';

NewsApiResponseModel NewsApiResponseModelFromJson(String str) => NewsApiResponseModel.fromJson(json.decode(str));

String NewsApiResponseModelToJson(NewsApiResponseModel data) => json.encode(data.toJson());

class NewsApiResponseModel {
    String status;
    int totalResults;
    List<ArticleModel> articles;

    NewsApiResponseModel({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory NewsApiResponseModel.fromJson(Map<String, dynamic> json) => NewsApiResponseModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<ArticleModel>.from(json["articles"].map((x) => ArticleModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}