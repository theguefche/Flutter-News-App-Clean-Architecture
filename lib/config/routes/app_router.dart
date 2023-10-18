import 'package:auto_route/auto_route.dart';
import 'package:news_app_clean_architecture/config/routes/guards/auth_guard.private.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/bloc/auth_state.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  final AuthState _authState;

  AppRouter(this._authState);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          path: "/login",
        ),
        AutoRoute(page: Oauth2Handler.page, path: "/oauth2"),
        AutoRoute(
            page: SavedArticles.page,
            path: "/SavedArticles",
            guards: [AuthGuardPrivate(_authState)]),
        AutoRoute(
          page: DailyNews.page,
          initial: true,
          path: "/daily",
          guards: [AuthGuardPrivate(_authState)],
        ),
        AutoRoute(
            page: ArticleDetailsView.page,
            path: "/ArticleDetails",
            guards: [AuthGuardPrivate(_authState)])
      ];
}
