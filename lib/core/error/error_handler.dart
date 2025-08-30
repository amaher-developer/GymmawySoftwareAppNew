import 'package:dio/dio.dart';

import '../enums/enums.dart';
import 'exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  static Failure mapExceptionToFailure(dynamic error, {String? message}) {
    if (error is DioError) {
      switch (error.type) {
        // Connection Timeout Exception

        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return const Failure.httpFailure(
            HttpErrorType.requestTimeout,
          );

        // Bad Response Exception

        case DioErrorType.badResponse:
          switch (error.response?.statusCode) {
            case 403:
              if (error.response?.data['message'] != null) {
                return Failure.unKnownFailure(
                  error.response?.data['message'],
                );
              } else if (error.response?.data['msg'] != null) {
                return Failure.unKnownFailure(
                  error.response?.data['msg'],
                );
              }
              return const Failure.httpFailure(HttpErrorType.unexpectedError);
            case 400:
              if (error.response?.data['message'] != null) {
                return Failure.unKnownFailure(
                  error.response?.data['message'],
                );
              }
              return const Failure.httpFailure(HttpErrorType.unexpectedError);
            case 500:
              return const Failure.httpFailure(
                HttpErrorType.internalServerError,
              );
          }
          // Other Types Of Bad Response Exceptions
          if (error.response?.data['message'] != null) {
            return Failure.unKnownFailure(
              error.response?.data['message'],
            );
          }
          return const Failure.httpFailure(HttpErrorType.unexpectedError);

        // Request Canceled  Exception

        case DioErrorType.cancel:
          return const Failure.unKnownFailure('Request was cancelled');

        // BadCertificate Exception
        case DioErrorType.badCertificate:
          return const Failure.httpFailure(HttpErrorType.badRequest);

        // Connection Exception
        case DioErrorType.connectionError:
          return const Failure.unKnownFailure('Connection error occurred');

        // Unknown Dio Error Exception

        case DioErrorType.unknown:
          return const Failure.httpFailure(HttpErrorType.unexpectedError);
      }

      // Other Types Of Dio Exceptions
    } else if (error is CustomException) {
      return error.when(
        httpException: (httpError) => Failure.httpFailure(httpError),
        noConnectionException: () => const Failure.noConnectionFailure(),
        cacheException: () => const Failure.cachedFailure(),
        unKnownException: (message) => Failure.unKnownFailure(
            message.isNotEmpty ? message : 'Unknown error occurred'),
      );
    } else {
      return const Failure.httpFailure(HttpErrorType.unexpectedError);
    }
  }
}
