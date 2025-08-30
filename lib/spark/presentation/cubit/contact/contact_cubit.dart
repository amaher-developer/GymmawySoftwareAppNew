import 'package:bloc/bloc.dart';
import 'package:zone/core/network/requests/contact_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/usecases/contact_use_case.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final ContactUseCase contactUseCase;

  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  final phoneFocusNode = FocusNode();
  final messageFocusNode = FocusNode();

  ContactCubit({required this.contactUseCase}) : super(ContactInitial());

  Future<void> sendMessage() async {
    emit(ContactLoadingState());
    final result = await contactUseCase(
      ContactRequest(
        phone: phoneController.text,
        message: messageController.text,
      ),
    );

    result.fold(
      (failure) {
        emit(ContactErrorState(
          message: failure.toError().message,
        ));
      },
      (splashDate) async {
        emit(const ContactSuccessState());
        phoneController.clear();
        messageController.clear();
      },
    );
  }

  void changeContactFormState() {
    emit(ContactFormValidState(
      isContactFormValid:
          phoneController.text.isNotEmpty && messageController.text.isNotEmpty,
    ));
  }
}
