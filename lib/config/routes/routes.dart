import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/pages/login.dart';

import '../../features/daily_news/domain/entities/article.dart';
import '../../features/daily_news/presentation/pages/article_detail/article_detail.dart';
import '../../features/daily_news/presentation/pages/home/daily_news.dart';
import '../../features/daily_news/presentation/pages/saved_article/saved_article.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case DailyNews.routeName:
        return _materialRoute(const DailyNews());

      case ArticleDetailsView.routeName:
        return _materialRoute(ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case SavedArticles.routeName:
        return _materialRoute(const SavedArticles());
      
      case LoginScreen.routeName:
        return _materialRoute(LoginScreen());
        
      default:
        return _materialRoute(LoginScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
  
}
