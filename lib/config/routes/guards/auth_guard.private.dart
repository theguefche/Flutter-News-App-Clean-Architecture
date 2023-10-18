import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/config/routes/app_router.gr.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/bloc/auth_state.dart';

class AuthGuardPrivate extends AutoRouteGuard {
  final AuthState state;

  AuthGuardPrivate(this.state);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final auth = state.isAuthenticated;
    if (auth == true) {
      // resolver.next(true);
      router.navigate(LoginRoute());
    } else {
      router.navigate(LoginRoute());
    }
  }
}
