import 'package:pay_fare/models/client_model/register_model.dart';

abstract class AppRegisterStates {}

class AppRegisterInitialState extends AppRegisterStates {}

class AppRegisterLoadingState extends AppRegisterStates {}

class AppRegisterSuccessState extends AppRegisterStates {
  final ClientRegisterModel registerModel;

  AppRegisterSuccessState(this.registerModel);
}

class AppRegisterErrorState extends AppRegisterStates {
  final String error;
  AppRegisterErrorState(this.error);
}

class Loading extends AppRegisterStates {}

class ErrorOccurred extends AppRegisterStates {
  final String errorMsg;

  ErrorOccurred({required this.errorMsg});
}

class PhoneNumberSubmited extends AppRegisterStates {}

class PhoneOTPVerified extends AppRegisterStates {}

class AppChangeRegisterPasswordVisibilityState extends AppRegisterStates {}
