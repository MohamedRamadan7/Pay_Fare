import 'package:pay_fare/models/car_model/car_trips_model.dart';
import 'package:pay_fare/models/car_model/get_chair_model.dart';
import 'package:pay_fare/models/driver_model/get_driver_model.dart';

abstract class DriverStates {}

class DriverInitialState extends DriverStates {}

class DriverChangeBottomNaveState extends DriverStates {}

class DriverChangeChairStaState extends DriverStates {}

class DriverSuccessChangeChairStaState extends DriverStates {}

class DriverErrorChangeChairState extends DriverStates {}

class DriverChangeActiveVisibilityState extends DriverStates {}

class DriverLoadingDriverDataState extends DriverStates {}

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

class DriverSuccessStatusState extends DriverStates {}

class DriverErrorStatusState extends DriverStates {}

class DriverSuccessRestChairsState extends DriverStates {}

class DriverErrorRestChairsState extends DriverStates {}

class DriverSuccessCarTripsState extends DriverStates {
  final CarTripsModel carTripsModel;
  DriverSuccessCarTripsState(this.carTripsModel);
}

class DriverErrorCarTripsState extends DriverStates {}

class DriverLoadingDriverRoleState extends DriverStates {}
class DriverSuccessDriverRoleState extends DriverStates {}

class DriverErrorDriverRoleState extends DriverStates {}
