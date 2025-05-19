part of 'contact_us_bloc.dart';

sealed class ContactUsState extends Equatable {
  const ContactUsState();
  
  @override
  List<Object> get props => [];
}

final class ContactUsInitial extends ContactUsState {}
