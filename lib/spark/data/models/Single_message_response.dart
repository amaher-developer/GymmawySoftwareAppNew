/*
   "status": 200,
    "success": true,
    "message": "تم حجز التدريب وسيتم التواصل معك من قبل سبارك فتنس علي رقم 01200000"
  **/
class SingleMessageResponse {
  SingleMessageResponse({
    this.status,
    this.success,
    this.message,
  });

  final int? status;
  final bool? success;
  final String? message;

  factory SingleMessageResponse.fromJson(Map<String, dynamic> json) =>
      SingleMessageResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
      };
}
