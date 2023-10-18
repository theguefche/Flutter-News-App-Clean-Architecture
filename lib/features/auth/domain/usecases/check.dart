import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/core/usecase/usecase.dart';
import 'package:news_app_clean_architecture/features/auth/domain/entities/login_payload.dart';
import 'package:news_app_clean_architecture/features/auth/domain/repositories/auth_repository.dart';

class CheckAuthUseCase implements UseCase<DataState<bool>, void> {

  final AuthRepository _authRepository;

  CheckAuthUseCase(this._authRepository);
  
  @override
  Future<DataState<bool>> call({void params}) async {
    return _authRepository.checkAuth();
  }

}
