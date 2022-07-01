import 'package:pay_fare/models/car_model/get_chair_model.dart';
import 'package:pay_fare/models/car_model/qr_code.dart';
import 'package:pay_fare/models/client_model/client_history_model.dart';
import 'package:pay_fare/models/client_model/client_login_model.dart';
import 'package:pay_fare/models/client_model/client_wallet_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}
class AppLoadingGetDataState extends AppStates {}
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

class AppSuccessChairDataState extends AppStates {
  final GetChair chairModel;
  AppSuccessChairDataState(this.chairModel);
}

class AppErrorChairDataState extends AppStates {}

class AppSuccessWalletDataState extends AppStates {}

class AppErrorWalletDataState extends AppStates {}


class AppSuccessSendBalanceState extends AppStates {}

class AppErrorSendBalanceState extends AppStates {}

class AppSuccessQrDataState extends AppStates {
  final QrModel qrModel;
  AppSuccessQrDataState(this.qrModel);
}

class AppErrorQrDataState extends AppStates {}

class AppSuccessPayfareState extends AppStates {}

class AppErrorPayfareState extends AppStates {}

class AppSuccessClientHistoryState extends AppStates {
  final ClientRidesHistoryModel clientRidesHistoryModel;
  AppSuccessClientHistoryState(this.clientRidesHistoryModel);
}

class AppErrorClientHistoryState extends AppStates {}
class AppLoadingPayfareState extends AppStates {}

class AppSuccessgetChairDataState extends AppStates {
  final GetChair chairModel;
  AppSuccessgetChairDataState(this.chairModel);
}

class AppErrorgetChairDataState extends AppStates {}
