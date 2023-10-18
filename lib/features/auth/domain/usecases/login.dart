import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/core/usecase/usecase.dart';
import 'package:news_app_clean_architecture/features/auth/domain/entities/login_payload.dart';
import 'package:news_app_clean_architecture/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<DataState<bool>, LoginPayloadEntity> {

  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);
  
  @override
  Future<DataState<bool>> call({required LoginPayloadEntity params}) async {
    return _authRepository.authLogin(params);
  }

}
