import 'package:pay_fare/models/client_model/client_login_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNaveState extends AppStates {}

class AppChangeChairStaState extends AppStates {}

class AppSuccessChangeChairStaState extends AppStates {}

class AppErrorChangeChairState extends AppStates {}

class AppScanState extends AppStates {}

class AppScanErrorState extends AppStates {}

class AppSuccessUserDataState extends AppStates {
  final ClientLoginModel userModel;
  AppSuccessUserDataState(this.userModel);
}

class AppErrorUserDataState extends AppStates {}
