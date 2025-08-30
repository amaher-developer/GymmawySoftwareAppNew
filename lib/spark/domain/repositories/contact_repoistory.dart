import 'package:dartz/dartz.dart';
import 'package:zone/core/network/requests/contact_request.dart';

import '../../../core/error/failures.dart';
import '../../../core/use_cases/base_use_case.dart';

abstract class ContactRepository {
  Future<Either<Failure, NoOutput>> sendMessage(ContactRequest request);
}
