class ApiInfoModel {
  final String? status;
  final String? message;
  final String? data;
  final String? success;

  ApiInfoModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory ApiInfoModel.fromJson(Map<String, dynamic> json) => ApiInfoModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
        "success": success,
      };
}
