

import 'package:pay_fare/models/station_model.dart';

abstract class AdminStates{}

class AdminInitialState extends AdminStates{}

class AdminChangeBottomNaveState extends AdminStates{}

class AdminChangeChairStaState extends AdminStates{}

class AdminSuccessChangeChairStaState extends AdminStates{}

class AdminErrorChangeChairState extends AdminStates{}
class onChangedDropdownMenuState extends AdminStates{}

class AdminSuccessStationState extends AdminStates {
  final StationModel stationModel;
  AdminSuccessStationState(this.stationModel);
}

class AdminErrorStationState extends AdminStates {}

class changePriceState extends AdminStates{}
