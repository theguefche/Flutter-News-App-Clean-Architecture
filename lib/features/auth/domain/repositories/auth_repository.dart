import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/auth/domain/entities/login_payload.dart';

abstract class AuthRepository {
  Future<DataState<bool>> authLogin(LoginPayloadEntity payload);

  Future<DataState<bool>> checkAuth();
}
