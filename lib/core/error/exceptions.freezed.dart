// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HttpErrorType httpErrorType) httpException,
    required TResult Function() noConnectionException,
    required TResult Function() cacheException,
    required TResult Function(String message) unKnownException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HttpErrorType httpErrorType)? httpException,
    TResult? Function()? noConnectionException,
    TResult? Function()? cacheException,
    TResult? Function(String message)? unKnownException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HttpErrorType httpErrorType)? httpException,
    TResult Function()? noConnectionException,
    TResult Function()? cacheException,
    TResult Function(String message)? unKnownException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpException value) httpException,
    required TResult Function(_NoConnectionException value)
        noConnectionException,
    required TResult Function(_CacheException value) cacheException,
    required TResult Function(_UnKnownException value) unKnownException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpException value)? httpException,
    TResult? Function(_NoConnectionException value)? noConnectionException,
    TResult? Function(_CacheException value)? cacheException,
    TResult? Function(_UnKnownException value)? unKnownException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpException value)? httpException,
    TResult Function(_NoConnectionException value)? noConnectionException,
    TResult Function(_CacheException value)? cacheException,
    TResult Function(_UnKnownException value)? unKnownException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomExceptionCopyWith<$Res> {
  factory $CustomExceptionCopyWith(
          CustomException value, $Res Function(CustomException) then) =
      _$CustomExceptionCopyWithImpl<$Res, CustomException>;
}

/// @nodoc
class _$CustomExceptionCopyWithImpl<$Res, $Val extends CustomException>
    implements $CustomExceptionCopyWith<$Res> {
  _$CustomExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_HttpExceptionCopyWith<$Res> {
  factory _$$_HttpExceptionCopyWith(
          _$_HttpException value, $Res Function(_$_HttpException) then) =
      __$$_HttpExceptionCopyWithImpl<$Res>;
  @useResult
  $Res call({HttpErrorType httpErrorType});
}

/// @nodoc
class __$$_HttpExceptionCopyWithImpl<$Res>
    extends _$CustomExceptionCopyWithImpl<$Res, _$_HttpException>
    implements _$$_HttpExceptionCopyWith<$Res> {
  __$$_HttpExceptionCopyWithImpl(
      _$_HttpException _value, $Res Function(_$_HttpException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? httpErrorType = null,
  }) {
    return _then(_$_HttpException(
      null == httpErrorType
          ? _value.httpErrorType
          : httpErrorType // ignore: cast_nullable_to_non_nullable
              as HttpErrorType,
    ));
  }
}

/// @nodoc

class _$_HttpException extends _HttpException {
  const _$_HttpException(this.httpErrorType) : super._();

  @override
  final HttpErrorType httpErrorType;

  @override
  String toString() {
    return 'CustomException.httpException(httpErrorType: $httpErrorType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HttpException &&
            (identical(other.httpErrorType, httpErrorType) ||
                other.httpErrorType == httpErrorType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, httpErrorType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HttpExceptionCopyWith<_$_HttpException> get copyWith =>
      __$$_HttpExceptionCopyWithImpl<_$_HttpException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HttpErrorType httpErrorType) httpException,
    required TResult Function() noConnectionException,
    required TResult Function() cacheException,
    required TResult Function(String message) unKnownException,
  }) {
    return httpException(httpErrorType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HttpErrorType httpErrorType)? httpException,
    TResult? Function()? noConnectionException,
    TResult? Function()? cacheException,
    TResult? Function(String message)? unKnownException,
  }) {
    return httpException?.call(httpErrorType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HttpErrorType httpErrorType)? httpException,
    TResult Function()? noConnectionException,
    TResult Function()? cacheException,
    TResult Function(String message)? unKnownException,
    required TResult orElse(),
  }) {
    if (httpException != null) {
      return httpException(httpErrorType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpException value) httpException,
    required TResult Function(_NoConnectionException value)
        noConnectionException,
    required TResult Function(_CacheException value) cacheException,
    required TResult Function(_UnKnownException value) unKnownException,
  }) {
    return httpException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpException value)? httpException,
    TResult? Function(_NoConnectionException value)? noConnectionException,
    TResult? Function(_CacheException value)? cacheException,
    TResult? Function(_UnKnownException value)? unKnownException,
  }) {
    return httpException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpException value)? httpException,
    TResult Function(_NoConnectionException value)? noConnectionException,
    TResult Function(_CacheException value)? cacheException,
    TResult Function(_UnKnownException value)? unKnownException,
    required TResult orElse(),
  }) {
    if (httpException != null) {
      return httpException(this);
    }
    return orElse();
  }
}

abstract class _HttpException extends CustomException {
  const factory _HttpException(final HttpErrorType httpErrorType) =
      _$_HttpException;
  const _HttpException._() : super._();

  HttpErrorType get httpErrorType;
  @JsonKey(ignore: true)
  _$$_HttpExceptionCopyWith<_$_HttpException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NoConnectionExceptionCopyWith<$Res> {
  factory _$$_NoConnectionExceptionCopyWith(_$_NoConnectionException value,
          $Res Function(_$_NoConnectionException) then) =
      __$$_NoConnectionExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NoConnectionExceptionCopyWithImpl<$Res>
    extends _$CustomExceptionCopyWithImpl<$Res, _$_NoConnectionException>
    implements _$$_NoConnectionExceptionCopyWith<$Res> {
  __$$_NoConnectionExceptionCopyWithImpl(_$_NoConnectionException _value,
      $Res Function(_$_NoConnectionException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NoConnectionException extends _NoConnectionException {
  const _$_NoConnectionException() : super._();

  @override
  String toString() {
    return 'CustomException.noConnectionException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NoConnectionException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HttpErrorType httpErrorType) httpException,
    required TResult Function() noConnectionException,
    required TResult Function() cacheException,
    required TResult Function(String message) unKnownException,
  }) {
    return noConnectionException();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HttpErrorType httpErrorType)? httpException,
    TResult? Function()? noConnectionException,
    TResult? Function()? cacheException,
    TResult? Function(String message)? unKnownException,
  }) {
    return noConnectionException?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HttpErrorType httpErrorType)? httpException,
    TResult Function()? noConnectionException,
    TResult Function()? cacheException,
    TResult Function(String message)? unKnownException,
    required TResult orElse(),
  }) {
    if (noConnectionException != null) {
      return noConnectionException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpException value) httpException,
    required TResult Function(_NoConnectionException value)
        noConnectionException,
    required TResult Function(_CacheException value) cacheException,
    required TResult Function(_UnKnownException value) unKnownException,
  }) {
    return noConnectionException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpException value)? httpException,
    TResult? Function(_NoConnectionException value)? noConnectionException,
    TResult? Function(_CacheException value)? cacheException,
    TResult? Function(_UnKnownException value)? unKnownException,
  }) {
    return noConnectionException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpException value)? httpException,
    TResult Function(_NoConnectionException value)? noConnectionException,
    TResult Function(_CacheException value)? cacheException,
    TResult Function(_UnKnownException value)? unKnownException,
    required TResult orElse(),
  }) {
    if (noConnectionException != null) {
      return noConnectionException(this);
    }
    return orElse();
  }
}

abstract class _NoConnectionException extends CustomException {
  const factory _NoConnectionException() = _$_NoConnectionException;
  const _NoConnectionException._() : super._();
}

/// @nodoc
abstract class _$$_CacheExceptionCopyWith<$Res> {
  factory _$$_CacheExceptionCopyWith(
          _$_CacheException value, $Res Function(_$_CacheException) then) =
      __$$_CacheExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CacheExceptionCopyWithImpl<$Res>
    extends _$CustomExceptionCopyWithImpl<$Res, _$_CacheException>
    implements _$$_CacheExceptionCopyWith<$Res> {
  __$$_CacheExceptionCopyWithImpl(
      _$_CacheException _value, $Res Function(_$_CacheException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CacheException extends _CacheException {
  const _$_CacheException() : super._();

  @override
  String toString() {
    return 'CustomException.cacheException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CacheException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HttpErrorType httpErrorType) httpException,
    required TResult Function() noConnectionException,
    required TResult Function() cacheException,
    required TResult Function(String message) unKnownException,
  }) {
    return cacheException();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HttpErrorType httpErrorType)? httpException,
    TResult? Function()? noConnectionException,
    TResult? Function()? cacheException,
    TResult? Function(String message)? unKnownException,
  }) {
    return cacheException?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HttpErrorType httpErrorType)? httpException,
    TResult Function()? noConnectionException,
    TResult Function()? cacheException,
    TResult Function(String message)? unKnownException,
    required TResult orElse(),
  }) {
    if (cacheException != null) {
      return cacheException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpException value) httpException,
    required TResult Function(_NoConnectionException value)
        noConnectionException,
    required TResult Function(_CacheException value) cacheException,
    required TResult Function(_UnKnownException value) unKnownException,
  }) {
    return cacheException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpException value)? httpException,
    TResult? Function(_NoConnectionException value)? noConnectionException,
    TResult? Function(_CacheException value)? cacheException,
    TResult? Function(_UnKnownException value)? unKnownException,
  }) {
    return cacheException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpException value)? httpException,
    TResult Function(_NoConnectionException value)? noConnectionException,
    TResult Function(_CacheException value)? cacheException,
    TResult Function(_UnKnownException value)? unKnownException,
    required TResult orElse(),
  }) {
    if (cacheException != null) {
      return cacheException(this);
    }
    return orElse();
  }
}

abstract class _CacheException extends CustomException {
  const factory _CacheException() = _$_CacheException;
  const _CacheException._() : super._();
}

/// @nodoc
abstract class _$$_UnKnownExceptionCopyWith<$Res> {
  factory _$$_UnKnownExceptionCopyWith(
          _$_UnKnownException value, $Res Function(_$_UnKnownException) then) =
      __$$_UnKnownExceptionCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_UnKnownExceptionCopyWithImpl<$Res>
    extends _$CustomExceptionCopyWithImpl<$Res, _$_UnKnownException>
    implements _$$_UnKnownExceptionCopyWith<$Res> {
  __$$_UnKnownExceptionCopyWithImpl(
      _$_UnKnownException _value, $Res Function(_$_UnKnownException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_UnKnownException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UnKnownException extends _UnKnownException {
  const _$_UnKnownException([this.message = 'Unknown error occurred'])
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'CustomException.unKnownException(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnKnownException &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnKnownExceptionCopyWith<_$_UnKnownException> get copyWith =>
      __$$_UnKnownExceptionCopyWithImpl<_$_UnKnownException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HttpErrorType httpErrorType) httpException,
    required TResult Function() noConnectionException,
    required TResult Function() cacheException,
    required TResult Function(String message) unKnownException,
  }) {
    return unKnownException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HttpErrorType httpErrorType)? httpException,
    TResult? Function()? noConnectionException,
    TResult? Function()? cacheException,
    TResult? Function(String message)? unKnownException,
  }) {
    return unKnownException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HttpErrorType httpErrorType)? httpException,
    TResult Function()? noConnectionException,
    TResult Function()? cacheException,
    TResult Function(String message)? unKnownException,
    required TResult orElse(),
  }) {
    if (unKnownException != null) {
      return unKnownException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpException value) httpException,
    required TResult Function(_NoConnectionException value)
        noConnectionException,
    required TResult Function(_CacheException value) cacheException,
    required TResult Function(_UnKnownException value) unKnownException,
  }) {
    return unKnownException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpException value)? httpException,
    TResult? Function(_NoConnectionException value)? noConnectionException,
    TResult? Function(_CacheException value)? cacheException,
    TResult? Function(_UnKnownException value)? unKnownException,
  }) {
    return unKnownException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpException value)? httpException,
    TResult Function(_NoConnectionException value)? noConnectionException,
    TResult Function(_CacheException value)? cacheException,
    TResult Function(_UnKnownException value)? unKnownException,
    required TResult orElse(),
  }) {
    if (unKnownException != null) {
      return unKnownException(this);
    }
    return orElse();
  }
}

abstract class _UnKnownException extends CustomException {
  const factory _UnKnownException([final String message]) = _$_UnKnownException;
  const _UnKnownException._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_UnKnownExceptionCopyWith<_$_UnKnownException> get copyWith =>
      throw _privateConstructorUsedError;
}
