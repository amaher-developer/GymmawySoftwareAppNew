import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';
import 'custom_error.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();

  const factory Failure.httpFailure(HttpErrorType httpErrorType) = _HttpFailure;

  const factory Failure.noConnectionFailure() = _NoConnectionFailure;

  const factory Failure.cachedFailure() = _CacheFailure;

  const factory Failure.unKnownFailure([
    @Default('Unknown error occurred') String message,
  ]) = _UnKnownFailure;

  CustomError toError() {
    return when(
      httpFailure: (HttpErrorType httpError) {
        switch (httpError) {
          case HttpErrorType.badRequest:
            return const CustomError(
              title: 'طلب خطأ',
              message: 'طلب خطأ',
            );
          case HttpErrorType.unauthorized:
            return const CustomError(
              title: 'غير مصرح لك',
              message: 'غير مصرح لك',
            );
          case HttpErrorType.forbidden:
            return const CustomError(
              title: 'طلب ممنوع',
              message: 'طلب ممنوع',
            );
          case HttpErrorType.notFound:
            return const CustomError(
              title: 'لم يتم العثور علي نتائج',
              message: 'لم يتم العثور علي نتائج',
            );
          case HttpErrorType.requestTimeout:
            return const CustomError(
              title: 'انتهت فترة الطلب',
              message: 'انتهت فترة الطلب',
            );
          case HttpErrorType.internalServerError:
            return const CustomError(
              title: 'خطأ من السيرفر',
              message: 'خطأ من السيرفر',
            );
          case HttpErrorType.unexpectedError:
            return const CustomError(
              title: 'حدث خطأ ما',
              message: 'حدث خطأ ما',
            );
        }
      },
      noConnectionFailure: () {
        return const CustomError(
          title: 'لا يوجد انترنت',
          message: 'لا يوجد انترنت',
        );
      },
      cachedFailure: () {
        return const CustomError(
          title: 'Cache Error',
          message: 'Cache Error',
        );
      },
      unKnownFailure: (String message) {
        return CustomError(
          title: 'Unknown error occurred',
          message: message,
        );
      },
    );
  }
}
