import 'package:zone/spark/domain/repositories/shared_repoistory.dart';

class SharedUseCase {
  SharedUseCase({
    required this.sharedRepository,
  });

  final SharedRepository sharedRepository;

  Future<String?> getAccessToken() async {
    return await sharedRepository.getAccessToken();
  }

  Future<String?> getCurrentLanguage() async {
    return await sharedRepository.getCurrentLanguage();
  }

  Future<String?> getDeviceToken() async {
    return await sharedRepository.getDeviceToken();
  }

  Future<String?> getDeviceType() async {
    return await sharedRepository.getDeviceType();
  }

  Future<String?> getUser() async {
    return await sharedRepository.getUser();
  }

  Future<bool?> logout() async {
    return await sharedRepository.logout();
  }

  Future<bool?> setAccessToken(String token) async {
    return await sharedRepository.setAccessToken(token);
  }

  Future<bool?> setCurrentLanguage(String lang) async {
    return await sharedRepository.setCurrentLanguage(lang);
  }

  Future<bool?> setUser(String user) async {
    return await sharedRepository.setUser(user);
  }
}
