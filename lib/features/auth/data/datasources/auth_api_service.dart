import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/config/api/remote.dart';
part 'auth_api_service.g.dart';

//to generate: flutter pub run build_runner build

@RestApi(baseUrl: "$localApi/auth")
abstract class AuthApiService {
  factory AuthApiService(Dio dio) => _AuthApiService(remote);

  @POST('/login')
  Future<HttpResponse<void>> login(
    @Field("email") String? email,
    @Field("password") String? password,
  );

  @GET("/check")
  Future<HttpResponse<void>> check();

  
}
