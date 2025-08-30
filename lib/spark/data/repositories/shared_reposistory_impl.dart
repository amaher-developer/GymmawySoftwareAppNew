import 'package:zone/spark/domain/repositories/shared_repoistory.dart';

import '../data_sources/local_data_source/shared_local_data_source/shared_local_data_source.dart';

class SharedRepositoryImpl implements SharedRepository {
  SharedRepositoryImpl({
    required this.sharedLocalDataSource,
  });

  final SharedLocalDataSource sharedLocalDataSource;

  @override
  Future<String?> getAccessToken() {
    // TODO: implement getAccessToken
    throw UnimplementedError();
  }

  @override
  Future<String?> getCurrentLanguage() {
    // TODO: implement getCurrentLanguage
    throw UnimplementedError();
  }

  @override
  Future<String?> getDeviceToken() {
    // TODO: implement getDeviceToken
    throw UnimplementedError();
  }

  @override
  Future<String?> getDeviceType() {
    // TODO: implement getDeviceType
    throw UnimplementedError();
  }

  @override
  Future<String?> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool?> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool?> setAccessToken(String token) {
    // TODO: implement setAccessToken
    throw UnimplementedError();
  }

  @override
  Future<bool?> setCurrentLanguage(String lang) {
    // TODO: implement setCurrentLanguage
    throw UnimplementedError();
  }

  @override
  Future<bool?> setUser(String user) {
    // TODO: implement setUser
    throw UnimplementedError();
  }
}
