abstract class SharedLocalDataSource {
  Future<String?> getCurrentLanguage();

  Future<bool?> setCurrentLanguage(String lang);

  Future<String?> getAccessToken();

  Future<bool?> setAccessToken(String token);

  Future<String?> getDeviceToken();

  Future<String?> getDeviceType();

  Future<bool?> logout();

  Future<String?> getUser();

  Future<bool?> setUser(String user);
}
