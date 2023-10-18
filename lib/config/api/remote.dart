import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:news_app_clean_architecture/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<PersistCookieJar> initializeCookieJar() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final cookieJar = PersistCookieJar(storage: FileStorage(appDocumentDir.path));
  
  return cookieJar;
}

var remote = Dio(BaseOptions(
    connectTimeout: const Duration(milliseconds: 15000),
    sendTimeout: const Duration(milliseconds: 15000)))
  ..interceptors.addAll([
    CookieManager(cookieJar),
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: false,
    ),
  ]);
