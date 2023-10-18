import 'package:news_app_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/models/news_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/config/api/remote.dart';
part 'news_api_service.g.dart';

//to generate: flutter pub run build_runner build

@RestApi(baseUrl:newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) => _NewsApiService(remote);
  
  @GET('/top-headlines')
  Future<HttpResponse<NewsApiResponseModel>> getNewsArticles({
    @Query("apiKey") String ? apiKey,
    @Query("country") String ? country,
    @Query("category") String ? category,
  });
}