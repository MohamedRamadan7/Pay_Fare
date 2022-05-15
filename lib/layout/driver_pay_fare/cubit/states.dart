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
