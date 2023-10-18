// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:news_app_clean_architecture/core/splash_screen.dart' as _i7;
import 'package:news_app_clean_architecture/features/auth/presentation/pages/login.dart'
    as _i3;
import 'package:news_app_clean_architecture/features/auth/presentation/widgets/webview.dart'
    as _i5;
import 'package:news_app_clean_architecture/features/auth/presentation/widgets/wv.dart'
    as _i4;
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart'
    as _i10;
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/article_detail/article_detail.dart'
    as _i1;
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/home/daily_news.dart'
    as _i2;
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/saved_article/saved_article.dart'
    as _i6;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    ArticleDetailsView.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsViewArgs>(
          orElse: () => const ArticleDetailsViewArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ArticleDetailsView(
          key: args.key,
          article: args.article,
        ),
      );
    },
    DailyNews.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DailyNews(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
      );
    },
    Oauth2Handler.name: (routeData) {
      final args = routeData.argsAs<Oauth2HandlerArgs>(
          orElse: () => const Oauth2HandlerArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.Oauth2Handler(key: args.key),
      );
    },
    Oauth2HandlerX.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Oauth2HandlerX(),
      );
    },
    SavedArticles.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SavedArticles(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ArticleDetailsView]
class ArticleDetailsView extends _i8.PageRouteInfo<ArticleDetailsViewArgs> {
  ArticleDetailsView({
    _i9.Key? key,
    _i10.ArticleEntity? article,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ArticleDetailsView.name,
          args: ArticleDetailsViewArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleDetailsView';

  static const _i8.PageInfo<ArticleDetailsViewArgs> page =
      _i8.PageInfo<ArticleDetailsViewArgs>(name);
}

class ArticleDetailsViewArgs {
  const ArticleDetailsViewArgs({
    this.key,
    this.article,
  });

  final _i9.Key? key;

  final _i10.ArticleEntity? article;

  @override
  String toString() {
    return 'ArticleDetailsViewArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i2.DailyNews]
class DailyNews extends _i8.PageRouteInfo<void> {
  const DailyNews({List<_i8.PageRouteInfo>? children})
      : super(
          DailyNews.name,
          initialChildren: children,
        );

  static const String name = 'DailyNews';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<LoginRouteArgs> page =
      _i8.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.Oauth2Handler]
class Oauth2Handler extends _i8.PageRouteInfo<Oauth2HandlerArgs> {
  Oauth2Handler({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          Oauth2Handler.name,
          args: Oauth2HandlerArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Oauth2Handler';

  static const _i8.PageInfo<Oauth2HandlerArgs> page =
      _i8.PageInfo<Oauth2HandlerArgs>(name);
}

class Oauth2HandlerArgs {
  const Oauth2HandlerArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'Oauth2HandlerArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.Oauth2HandlerX]
class Oauth2HandlerX extends _i8.PageRouteInfo<void> {
  const Oauth2HandlerX({List<_i8.PageRouteInfo>? children})
      : super(
          Oauth2HandlerX.name,
          initialChildren: children,
        );

  static const String name = 'Oauth2HandlerX';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SavedArticles]
class SavedArticles extends _i8.PageRouteInfo<void> {
  const SavedArticles({List<_i8.PageRouteInfo>? children})
      : super(
          SavedArticles.name,
          initialChildren: children,
        );

  static const String name = 'SavedArticles';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
