import 'package:dartz/dartz.dart';
import 'package:zone/core/network/requests/contact_request.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/base_use_case.dart';
import '../repositories/contact_repoistory.dart';

class ContactUseCase extends BaseUseCase<ContactRequest, NoOutput> {
  final ContactRepository contactRepository;

  ContactUseCase({required this.contactRepository});

  @override
  Future<Either<Failure, NoOutput>> call(ContactRequest input) async {
    return await contactRepository.sendMessage(input);
  }
}
