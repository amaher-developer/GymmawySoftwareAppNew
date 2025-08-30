import 'package:zone/core/network/requests/contact_request.dart';

abstract class ContactRemoteDataSource {
  Future<void> sendMessage(ContactRequest request);
}
