enum RequestState {
  loading,
  error,
  success,
}

enum HttpErrorType {
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  requestTimeout(408),
  internalServerError(501),
  unexpectedError(0);

  const HttpErrorType(this.code);

  final int code;
}
enum Favorite{
  addedSuccess('Product Added Successfully To Favorites'),
  deletedSuccess('Product Deleted Successfully'),
  clearedSuccess('Favorites Cleared Successfully');
  const Favorite(this.message);
   final String message;
}

enum TrainingPlans{
  trainType(1),
  dietType(2),
  allType(0);
  const TrainingPlans(this.type);
   final int type;
}
