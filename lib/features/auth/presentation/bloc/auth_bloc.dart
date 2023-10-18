import 'package:bloc/bloc.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/auth/domain/entities/login_payload.dart';
import 'package:news_app_clean_architecture/features/auth/domain/usecases/check.dart';
import 'package:news_app_clean_architecture/features/auth/domain/usecases/login.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final CheckAuthUseCase _checkAuthUseCase;

  AuthBloc(this._loginUseCase, this._checkAuthUseCase) : super(Unknown()) {
    on<Login>(onLogin);
    on<CheckAuth>(onInitial);
  }

  void onLogin(Login event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    final payload =
        LoginPayloadEntity(email: event.email, password: event.password);

    final dataState = await _loginUseCase.call(params: payload);

    if (dataState is DataSuccess) {
      emit(const Authenticated(true));
    }

    if (dataState is DataFailed) {
      emit(NoneAuthenticated(dataState.error!, false));
    }
  }

  void onInitial(CheckAuth event, Emitter<AuthState> emit) async {
    final dataState = await _checkAuthUseCase.call();

    if (dataState is DataSuccess) {
      emit(const Authenticated(true));
    }

    if (dataState is DataFailed) {
      emit(NoneAuthenticated(dataState.error!, false));
    }
  }
}
