import 'package:zone/core/network/requests/contact_request.dart';
import 'package:dio/dio.dart';

import '../../../../../core/helper/user_helper.dart';
import 'contact_remote_data_source.dart';

class ContactRemoteDataSourceImpl implements ContactRemoteDataSource {
  Dio dio;

  ContactRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> sendMessage(ContactRequest request) async {
    try {
      final response = await dio.post(
        'contact',
        queryParameters: {'Accept': 'application/json'},
        data: {
          "lang": UserHelper.getLanguage(),
          "phone": request.phone,
          "message": request.message
        },
      );
    } catch (exception) {
      rethrow;
    }
  }
}
