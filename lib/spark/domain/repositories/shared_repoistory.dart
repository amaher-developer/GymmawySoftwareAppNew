abstract class SharedRepository {
  Future<String?> getAccessToken();

  Future<bool?> setAccessToken(String token);

  Future<String?> getDeviceToken();

  Future<String?> getDeviceType();

  Future<bool?> logout();

  Future<String?> getCurrentLanguage();

  Future<bool?> setCurrentLanguage(String lang);

  Future<bool?> setUser(String user);

  Future<String?> getUser();
}
