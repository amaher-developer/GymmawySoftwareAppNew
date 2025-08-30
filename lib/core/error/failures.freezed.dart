// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HttpErrorType httpErrorType) httpFailure,
    required TResult Function() noConnectionFailure,
    required TResult Function() cachedFailure,
    required TResult Function(String message) unKnownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HttpErrorType httpErrorType)? httpFailure,
    TResult? Function()? noConnectionFailure,
    TResult? Function()? cachedFailure,
    TResult? Function(String message)? unKnownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HttpErrorType httpErrorType)? httpFailure,
    TResult Function()? noConnectionFailure,
    TResult Function()? cachedFailure,
    TResult Function(String message)? unKnownFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpFailure value) httpFailure,
    required TResult Function(_NoConnectionFailure value) noConnectionFailure,
    required TResult Function(_CacheFailure value) cachedFailure,
    required TResult Function(_UnKnownFailure value) unKnownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpFailure value)? httpFailure,
    TResult? Function(_NoConnectionFailure value)? noConnectionFailure,
    TResult? Function(_CacheFailure value)? cachedFailure,
    TResult? Function(_UnKnownFailure value)? unKnownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpFailure value)? httpFailure,
    TResult Function(_NoConnectionFailure value)? noConnectionFailure,
    TResult Function(_CacheFailure value)? cachedFailure,
    TResult Function(_UnKnownFailure value)? unKnownFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_HttpFailureCopyWith<$Res> {
  factory _$$_HttpFailureCopyWith(
          _$_HttpFailure value, $Res Function(_$_HttpFailure) then) =
      __$$_HttpFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({HttpErrorType httpErrorType});
}

/// @nodoc
class __$$_HttpFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_HttpFailure>
    implements _$$_HttpFailureCopyWith<$Res> {
  __$$_HttpFailureCopyWithImpl(
      _$_HttpFailure _value, $Res Function(_$_HttpFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? httpErrorType = null,
  }) {
    return _then(_$_HttpFailure(
      null == httpErrorType
          ? _value.httpErrorType
          : httpErrorType // ignore: cast_nullable_to_non_nullable
              as HttpErrorType,
    ));
  }
}

/// @nodoc

class _$_HttpFailure extends _HttpFailure {
  const _$_HttpFailure(this.httpErrorType) : super._();

  @override
  final HttpErrorType httpErrorType;

  @override
  String toString() {
    return 'Failure.httpFailure(httpErrorType: $httpErrorType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HttpFailure &&
            (identical(other.httpErrorType, httpErrorType) ||
                other.httpErrorType == httpErrorType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, httpErrorType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HttpFailureCopyWith<_$_HttpFailure> get copyWith =>
      __$$_HttpFailureCopyWithImpl<_$_HttpFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HttpErrorType httpErrorType) httpFailure,
    required TResult Function() noConnectionFailure,
    required TResult Function() cachedFailure,
    required TResult Function(String message) unKnownFailure,
  }) {
    return httpFailure(httpErrorType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HttpErrorType httpErrorType)? httpFailure,
    TResult? Function()? noConnectionFailure,
    TResult? Function()? cachedFailure,
    TResult? Function(String message)? unKnownFailure,
  }) {
    return httpFailure?.call(httpErrorType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HttpErrorType httpErrorType)? httpFailure,
    TResult Function()? noConnectionFailure,
    TResult Function()? cachedFailure,
    TResult Function(String message)? unKnownFailure,
    required TResult orElse(),
  }) {
    if (httpFailure != null) {
      return httpFailure(httpErrorType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpFailure value) httpFailure,
    required TResult Function(_NoConnectionFailure value) noConnectionFailure,
    required TResult Function(_CacheFailure value) cachedFailure,
    required TResult Function(_UnKnownFailure value) unKnownFailure,
  }) {
    return httpFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpFailure value)? httpFailure,
    TResult? Function(_NoConnectionFailure value)? noConnectionFailure,
    TResult? Function(_CacheFailure value)? cachedFailure,
    TResult? Function(_UnKnownFailure value)? unKnownFailure,
  }) {
    return httpFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpFailure value)? httpFailure,
    TResult Function(_NoConnectionFailure value)? noConnectionFailure,
    TResult Function(_CacheFailure value)? cachedFailure,
    TResult Function(_UnKnownFailure value)? unKnownFailure,
    required TResult orElse(),
  }) {
    if (httpFailure != null) {
      return httpFailure(this);
    }
    return orElse();
  }
}

abstract class _HttpFailure extends Failure {
  const factory _HttpFailure(final HttpErrorType httpErrorType) =
      _$_HttpFailure;
  const _HttpFailure._() : super._();

  HttpErrorType get httpErrorType;
  @JsonKey(ignore: true)
  _$$_HttpFailureCopyWith<_$_HttpFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NoConnectionFailureCopyWith<$Res> {
  factory _$$_NoConnectionFailureCopyWith(_$_NoConnectionFailure value,
          $Res Function(_$_NoConnectionFailure) then) =
      __$$_NoConnectionFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NoConnectionFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_NoConnectionFailure>
    implements _$$_NoConnectionFailureCopyWith<$Res> {
  __$$_NoConnectionFailureCopyWithImpl(_$_NoConnectionFailure _value,
      $Res Function(_$_NoConnectionFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NoConnectionFailure extends _NoConnectionFailure {
  const _$_NoConnectionFailure() : super._();

  @override
  String toString() {
    return 'Failure.noConnectionFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NoConnectionFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HttpErrorType httpErrorType) httpFailure,
    required TResult Function() noConnectionFailure,
    required TResult Function() cachedFailure,
    required TResult Function(String message) unKnownFailure,
  }) {
    return noConnectionFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HttpErrorType httpErrorType)? httpFailure,
    TResult? Function()? noConnectionFailure,
    TResult? Function()? cachedFailure,
    TResult? Function(String message)? unKnownFailure,
  }) {
    return noConnectionFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HttpErrorType httpErrorType)? httpFailure,
    TResult Function()? noConnectionFailure,
    TResult Function()? cachedFailure,
    TResult Function(String message)? unKnownFailure,
    required TResult orElse(),
  }) {
    if (noConnectionFailure != null) {
      return noConnectionFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpFailure value) httpFailure,
    required TResult Function(_NoConnectionFailure value) noConnectionFailure,
    required TResult Function(_CacheFailure value) cachedFailure,
    required TResult Function(_UnKnownFailure value) unKnownFailure,
  }) {
    return noConnectionFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpFailure value)? httpFailure,
    TResult? Function(_NoConnectionFailure value)? noConnectionFailure,
    TResult? Function(_CacheFailure value)? cachedFailure,
    TResult? Function(_UnKnownFailure value)? unKnownFailure,
  }) {
    return noConnectionFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpFailure value)? httpFailure,
    TResult Function(_NoConnectionFailure value)? noConnectionFailure,
    TResult Function(_CacheFailure value)? cachedFailure,
    TResult Function(_UnKnownFailure value)? unKnownFailure,
    required TResult orElse(),
  }) {
    if (noConnectionFailure != null) {
      return noConnectionFailure(this);
    }
    return orElse();
  }
}

abstract class _NoConnectionFailure extends Failure {
  const factory _NoConnectionFailure() = _$_NoConnectionFailure;
  const _NoConnectionFailure._() : super._();
}

/// @nodoc
abstract class _$$_CacheFailureCopyWith<$Res> {
  factory _$$_CacheFailureCopyWith(
          _$_CacheFailure value, $Res Function(_$_CacheFailure) then) =
      __$$_CacheFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CacheFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_CacheFailure>
    implements _$$_CacheFailureCopyWith<$Res> {
  __$$_CacheFailureCopyWithImpl(
      _$_CacheFailure _value, $Res Function(_$_CacheFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CacheFailure extends _CacheFailure {
  const _$_CacheFailure() : super._();

  @override
  String toString() {
    return 'Failure.cachedFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CacheFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HttpErrorType httpErrorType) httpFailure,
    required TResult Function() noConnectionFailure,
    required TResult Function() cachedFailure,
    required TResult Function(String message) unKnownFailure,
  }) {
    return cachedFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HttpErrorType httpErrorType)? httpFailure,
    TResult? Function()? noConnectionFailure,
    TResult? Function()? cachedFailure,
    TResult? Function(String message)? unKnownFailure,
  }) {
    return cachedFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HttpErrorType httpErrorType)? httpFailure,
    TResult Function()? noConnectionFailure,
    TResult Function()? cachedFailure,
    TResult Function(String message)? unKnownFailure,
    required TResult orElse(),
  }) {
    if (cachedFailure != null) {
      return cachedFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpFailure value) httpFailure,
    required TResult Function(_NoConnectionFailure value) noConnectionFailure,
    required TResult Function(_CacheFailure value) cachedFailure,
    required TResult Function(_UnKnownFailure value) unKnownFailure,
  }) {
    return cachedFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpFailure value)? httpFailure,
    TResult? Function(_NoConnectionFailure value)? noConnectionFailure,
    TResult? Function(_CacheFailure value)? cachedFailure,
    TResult? Function(_UnKnownFailure value)? unKnownFailure,
  }) {
    return cachedFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpFailure value)? httpFailure,
    TResult Function(_NoConnectionFailure value)? noConnectionFailure,
    TResult Function(_CacheFailure value)? cachedFailure,
    TResult Function(_UnKnownFailure value)? unKnownFailure,
    required TResult orElse(),
  }) {
    if (cachedFailure != null) {
      return cachedFailure(this);
    }
    return orElse();
  }
}

abstract class _CacheFailure extends Failure {
  const factory _CacheFailure() = _$_CacheFailure;
  const _CacheFailure._() : super._();
}

/// @nodoc
abstract class _$$_UnKnownFailureCopyWith<$Res> {
  factory _$$_UnKnownFailureCopyWith(
          _$_UnKnownFailure value, $Res Function(_$_UnKnownFailure) then) =
      __$$_UnKnownFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_UnKnownFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_UnKnownFailure>
    implements _$$_UnKnownFailureCopyWith<$Res> {
  __$$_UnKnownFailureCopyWithImpl(
      _$_UnKnownFailure _value, $Res Function(_$_UnKnownFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_UnKnownFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UnKnownFailure extends _UnKnownFailure {
  const _$_UnKnownFailure([this.message = 'Unknown error occurred'])
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.unKnownFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnKnownFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnKnownFailureCopyWith<_$_UnKnownFailure> get copyWith =>
      __$$_UnKnownFailureCopyWithImpl<_$_UnKnownFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HttpErrorType httpErrorType) httpFailure,
    required TResult Function() noConnectionFailure,
    required TResult Function() cachedFailure,
    required TResult Function(String message) unKnownFailure,
  }) {
    return unKnownFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HttpErrorType httpErrorType)? httpFailure,
    TResult? Function()? noConnectionFailure,
    TResult? Function()? cachedFailure,
    TResult? Function(String message)? unKnownFailure,
  }) {
    return unKnownFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HttpErrorType httpErrorType)? httpFailure,
    TResult Function()? noConnectionFailure,
    TResult Function()? cachedFailure,
    TResult Function(String message)? unKnownFailure,
    required TResult orElse(),
  }) {
    if (unKnownFailure != null) {
      return unKnownFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpFailure value) httpFailure,
    required TResult Function(_NoConnectionFailure value) noConnectionFailure,
    required TResult Function(_CacheFailure value) cachedFailure,
    required TResult Function(_UnKnownFailure value) unKnownFailure,
  }) {
    return unKnownFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpFailure value)? httpFailure,
    TResult? Function(_NoConnectionFailure value)? noConnectionFailure,
    TResult? Function(_CacheFailure value)? cachedFailure,
    TResult? Function(_UnKnownFailure value)? unKnownFailure,
  }) {
    return unKnownFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpFailure value)? httpFailure,
    TResult Function(_NoConnectionFailure value)? noConnectionFailure,
    TResult Function(_CacheFailure value)? cachedFailure,
    TResult Function(_UnKnownFailure value)? unKnownFailure,
    required TResult orElse(),
  }) {
    if (unKnownFailure != null) {
      return unKnownFailure(this);
    }
    return orElse();
  }
}

abstract class _UnKnownFailure extends Failure {
  const factory _UnKnownFailure([final String message]) = _$_UnKnownFailure;
  const _UnKnownFailure._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_UnKnownFailureCopyWith<_$_UnKnownFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
