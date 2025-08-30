extension JaonData on Map<String, dynamic> {
  Map<String, dynamic> activityJson() {
    return this['result']['activity'];
  }

  Map<String, dynamic> activitiesJson() {
    return this['result']['activities'];
  }

  Map<String, dynamic> storeJson() {
    return this['result']['store'];
  }

  Map<String, dynamic> storesJson() {
    return this['result']['stores'];
  }
}
