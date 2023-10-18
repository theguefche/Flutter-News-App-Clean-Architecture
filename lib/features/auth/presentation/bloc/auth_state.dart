import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture/core/resources/error.dart';

abstract class AuthState extends Equatable {
  final bool? isAuthenticated;
  final ApiError? error;

  const AuthState({this.isAuthenticated, this.error});

  @override
  List<Object> get props => [];
}

class Unknown extends AuthState {}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class Authenticated extends AuthState {
  const Authenticated(bool isAuthenticated)
      : super(isAuthenticated: isAuthenticated);
}

class NoneAuthenticated extends AuthState {
  const NoneAuthenticated(ApiError error, bool isAuthenticated)
      : super(error: error , isAuthenticated: isAuthenticated) ;
}


