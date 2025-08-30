import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/core/network/requests/contact_request.dart';
import 'package:zone/core/use_cases/base_use_case.dart';
import 'package:zone/spark/domain/repositories/contact_repoistory.dart';

import '../../../core/error/error_handler.dart';
import '../data_sources/remote_data/contact_remote_data_source/contact_remote_data_source.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactRemoteDataSource contactRemoteDataSource;

  ContactRepositoryImpl({required this.contactRemoteDataSource});

  @override
  Future<Either<Failure, NoOutput>> sendMessage(ContactRequest request) async {
    try {
      await contactRemoteDataSource.sendMessage(request);
      return const Right(NoOutput());
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }
}
