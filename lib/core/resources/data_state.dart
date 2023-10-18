import 'package:news_app_clean_architecture/core/resources/error.dart';

abstract class DataState<T> {
  final T ? data;
  final ApiError ? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ApiError error) : super(error: error);
}
