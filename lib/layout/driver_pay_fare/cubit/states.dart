import 'package:pay_fare/models/car_model/get_chair_model.dart';
import 'package:pay_fare/models/driver_model/get_driver_model.dart';

abstract class DriverStates {}

class DriverInitialState extends DriverStates {}

class DriverChangeBottomNaveState extends DriverStates {}

class DriverChangeChairStaState extends DriverStates {}

class DriverSuccessChangeChairStaState extends DriverStates {}

class DriverErrorChangeChairState extends DriverStates {}

class DriverChangeActiveVisibilityState extends DriverStates {}

class DriverSuccessDriverDataState extends DriverStates {
  final GetDriverModel driverModel;
  DriverSuccessDriverDataState(this.driverModel);
}

class DriverErrorDriverDataState extends DriverStates {}

class DriverSuccessChairDataState extends DriverStates {
  final GetChair chairModel;
  DriverSuccessChairDataState(this.chairModel);
}

class DriverErrorChairDataState extends DriverStates {}