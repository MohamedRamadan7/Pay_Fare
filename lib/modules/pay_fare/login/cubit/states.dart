
import 'package:pay_fare/models/client_model/client_login_model.dart';

abstract class AppLoginStates {}

class AppLoginInitialState extends AppLoginStates{}

class AppLoginLoadingState extends AppLoginStates{}

class AppLoginSuccessState extends AppLoginStates{
  final ClientLoginModel loginModel;
  AppLoginSuccessState(this.loginModel);
}

class AppLoginErrorState extends AppLoginStates{
  final String error;
  AppLoginErrorState(this.error);
}

class AppChangePasswordVisibilityState extends AppLoginStates{}
