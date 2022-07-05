

import 'package:pay_fare/models/car_model/post_car_model.dart';
import 'package:pay_fare/models/driver_model/post_driver_miodel.dart';
import 'package:pay_fare/models/owner_model/add_driver_inqueue_model.dart';
import 'package:pay_fare/models/owner_model/drivers_online_model.dart';
import 'package:pay_fare/models/owner_model/owner_model.dart';
import 'package:pay_fare/models/station_model.dart';
import 'package:pay_fare/models/trafic_model/trafic_model.dart';

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

class AdminSuccessOwnerState extends AdminStates {
  final OwnerModel ownerModel;
  AdminSuccessOwnerState(this.ownerModel);
}
class AdminErrorOwnerState extends AdminStates {}

class AdminSuccessTrafficState extends AdminStates {
  final TraficModel traficmodel;
  AdminSuccessTrafficState(this.traficmodel);
}
class AdminErrorTrafficState extends AdminStates {}

class changePriceState extends AdminStates{}


class AdminPostDriverLoadingState extends AdminStates{}

class AdminPostDriverSuccessState extends AdminStates {
  final PostDriver postDriverModel;

  AdminPostDriverSuccessState(this.postDriverModel);
}

class AdminPostDriverErrorState extends AdminStates {
  final String error;
  AdminPostDriverErrorState(this.error);
}


class AdminPostCarSuccessState extends AdminStates {
  final PostCarModel postCarModel;

  AdminPostCarSuccessState(this.postCarModel);
}

class AdminPostCarErrorState extends AdminStates {
  final String error;
  AdminPostCarErrorState(this.error);
}


class AdminSuccessDriverInQueueState extends AdminStates {
  final AddDriverInQueueModel addDriverInQueueModel;

  AdminSuccessDriverInQueueState(this.addDriverInQueueModel);
}

class AdminErrorDriverInQueueState extends AdminStates {
  final String error;
  AdminErrorDriverInQueueState(this.error);
}

class AdminSuccessAllQueueDataState extends AdminStates {
  final AddDriverInQueueModel addDriverInQueueModel;

  AdminSuccessAllQueueDataState(this.addDriverInQueueModel);
}

class AdminErrorAllQueueDataState extends AdminStates {
  final String error;
  AdminErrorAllQueueDataState(this.error);
}

class AdminSuccessRemoveFromQueueState extends AdminStates{}

class AdminErrorRemoveFromQueueState extends AdminStates{}

class AdminLoadingDriversOnlineState extends AdminStates {}
class AdminSuccessDriversOnlineState extends AdminStates {
  final DriversOnlineModel driversOnlineModel;

  AdminSuccessDriversOnlineState(this.driversOnlineModel);
}

class AdminErrorDriversOnlineState extends AdminStates {
  final String error;
  AdminErrorDriversOnlineState(this.error);
}


class AdminSuccessStatusState extends AdminStates{}

class AdminErrorStatusState extends AdminStates{}


