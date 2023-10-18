import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/core/resources/error.dart';
import 'package:news_app_clean_architecture/features/auth/data/datasources/auth_api_service.dart';
import 'package:news_app_clean_architecture/features/auth/domain/entities/login_payload.dart';
import 'package:news_app_clean_architecture/features/auth/domain/repositories/auth_repository.dart';
import 'package:retrofit/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<bool>> authLogin(LoginPayloadEntity payload) async {
    try {
      final httpResponse =
          await _authApiService.login(payload.email, payload.password);
      // await _authApiService.check();

      return const DataSuccess(true);
    } on DioException catch (e) {
      if (e.response.toString() != "null") {
        debugPrint("should not");
        final apiResponse = ApiError.fromJson(e.response!.data);
        final errorDetails = apiResponse.details ?? [];

        return DataFailed(ApiError(
          cause: apiResponse.cause,
          trace: apiResponse.trace,
          message: apiResponse.message,
          details: errorDetails,
        ));
      } else {
        return DataFailed(ApiError(
          cause: "Something Went Wrong !",
          trace: "Unknown",
          message: e.error.toString(),
        ));
      }
    }
  }

  @override
  Future<DataState<bool>> checkAuth() async {
    try {
      await _authApiService.check();

      return const DataSuccess(true);
    } on DioException catch (e) {
      debugPrint(e.toString());
      debugPrint(e.response.toString());

      if (e.response.toString() != "null") {
        debugPrint("should not");
        final apiResponse = ApiError.fromJson(e.response!.data);
        final errorDetails = apiResponse.details ?? [];

        return DataFailed(ApiError(
          cause: apiResponse.cause,
          trace: apiResponse.trace,
          message: apiResponse.message,
          details: errorDetails,
        ));
      } else {
        return DataFailed(ApiError(
          cause: "Something Went Wrong !",
          trace: "Unknown",
          message: e.error.toString(),
        ));
      }
    }
  }
}
