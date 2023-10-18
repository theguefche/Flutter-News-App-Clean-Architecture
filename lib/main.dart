import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_app_clean_architecture/config/api/remote.dart';
import 'package:news_app_clean_architecture/config/routes/app_router.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/bloc/auth_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';

import 'config/theme/app_themes.dart';
import 'injection_container.dart';

late PersistCookieJar cookieJar;
Future<void> main() async {
  final wb = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: wb);
  cookieJar = await initializeCookieJar();
  
  await initializeDependencies();

  FlutterNativeSplash.remove();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(value: sl<AuthBloc>()..add(CheckAuth())),
        // BlocProvider<RemoteArticlesBloc>.value(value: sl<RemoteArticlesBloc>()..add(GetArticles())),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state.isAuthenticated != null && state is! AuthLoading) {}
        },
        child: const MyApp(),
      ),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final state =
//         context.select((AuthBloc _bloc) => _bloc.state.isAuthenticated);

//     if (state != null) {
//       return MaterialApp.router(
//         debugShowCheckedModeBanner: false,
//         theme: theme(),
//         routerConfig: AppRouter(context.read<AuthBloc>().state).config(),
//       );
//     } else {
//       return const CircularProgressIndicator();
//     }
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state =
        context.select((AuthBloc _bloc) => _bloc.state.isAuthenticated);
    debugPrint("state " +state.toString());
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: state != null
          ? MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: theme(),
              routerConfig: AppRouter(context.read<AuthBloc>().state).config(),
            )
          : const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child:
                      CircularProgressIndicator(), // Replace with your loader widget
                ),
              )),
    );
  }
}
