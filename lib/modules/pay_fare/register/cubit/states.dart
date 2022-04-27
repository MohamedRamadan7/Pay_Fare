
abstract class AppRegisterStates {}

class AppRegisterInitialState extends AppRegisterStates{}

class AppRegisterLoadingState extends AppRegisterStates{}

class AppRegisterSuccessState extends AppRegisterStates{}

class AppRegisterErrorState extends AppRegisterStates{
  final String error;
  AppRegisterErrorState(this.error);
}
class AppCreateUserSuccessState extends AppRegisterStates{}

class AppCreateUserErrorState extends AppRegisterStates{
  final String error;
  AppCreateUserErrorState(this.error);
}
class Loading extends AppRegisterStates {}

class ErrorOccurred extends AppRegisterStates {
  final String errorMsg;

  ErrorOccurred({required this.errorMsg});
}

class PhoneNumberSubmited extends AppRegisterStates{}

class PhoneOTPVerified extends AppRegisterStates{}

class AppChangeRegisterPasswordVisibilityState extends AppRegisterStates{}
