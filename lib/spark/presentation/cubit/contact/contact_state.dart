part of 'contact_cubit.dart';

abstract class ContactState extends Equatable {
  const ContactState();
}

class ContactInitial extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactFormValidState extends ContactState {
  bool isContactFormValid = false;

  ContactFormValidState({required this.isContactFormValid});

  @override
  List<Object> get props => [isContactFormValid];
}

class ContactLoadingState extends ContactState {
  @override
  List<Object?> get props => [];
}

class ContactErrorState extends ContactState {
  final String message;

  const ContactErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ContactSuccessState extends ContactState {
  const ContactSuccessState();

  @override
  List<Object?> get props => [];
}
