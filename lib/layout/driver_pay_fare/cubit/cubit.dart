import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/driver_pay_fare/cubit/states.dart';
import 'package:pay_fare/models/car_model/car_trips_model.dart';
import 'package:pay_fare/models/car_model/get_chair_model.dart';
import 'package:pay_fare/models/driver_model/change_status_drive_model.dart';
import 'package:pay_fare/models/driver_model/drivers_role_model.dart';
import 'package:pay_fare/models/driver_model/get_driver_model.dart';
import 'package:pay_fare/models/driver_model/rest_chairs_model.dart';
import 'package:pay_fare/modules/driver_pay_fare/archive/driver_archive_screen.dart';
import 'package:pay_fare/modules/driver_pay_fare/home/driver_home_screen.dart';
import 'package:pay_fare/modules/driver_pay_fare/notifications/notification_screen.dart';
import 'package:pay_fare/modules/driver_pay_fare/wallet/driver_walet_screen.dart';
import 'package:pay_fare/shared/components/constants.dart';
import 'package:pay_fare/shared/network/end_points.dart';
import 'package:pay_fare/shared/network/local/cache_helper.dart';
import 'package:pay_fare/shared/network/remote/dio_helper.dart';

class DriverCubit extends Cubit<DriverStates> {
  DriverCubit() : super(DriverInitialState());

  static DriverCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;
  List<Widget> bottomScreen = [
    DriverHomeScreen(),
    DriverNotificationsScreen(),
    DriverWalletScreen(),
    DriverArchiveScreen(),
  ];

  List<String> titles = [
    'Home',
    'Notifications',
    'Wallet',
    'Archive',
  ];

  void changeBottomNave(index) {
    currentIndex = index;
    emit(DriverChangeBottomNaveState());
  }

  Map<int, bool> colorChair = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
    8: false,
    9: false,
    10: false,
    11: false,
    12: false,
    13: false,
  };

  void changeChair(int index) {
    colorChair.update(index, (value) => !value);

    emit(DriverChangeChairStaState());
  }

  IconData icon = Icons.toggle_off;
  bool Active = true;
  int value=0;
  void ChangeActiveVisibility() {
    Active = !Active;
    if(Active==true)
      {
        value=0;
      }else{
      value=1;
    }
    icon = Active ? Icons.toggle_off : Icons.toggle_on;
    emit(DriverChangeActiveVisibilityState());
  }

  GetDriverModel? driverModel;
  void getDriverData()  {
    emit(DriverLoadingDriverDataState());
     DioHelper.getData(url: GETDRIVER, query: {
      'phone': '${CacheHelper.getData(key: 'driverPhone')}',
    }).then((value) {
       driverModel = GetDriverModel.fromJson(value.data);
      print('data driver : ${driverModel!.user!.name}');
      getChairData(int.parse('${driverModel!.car!.id}'));
      getCarTripsData(int.parse('${driverModel!.car!.id}'));
      getDriverRoleData(driver_code: '${driverModel!.driverCode}');
      emit(DriverSuccessDriverDataState(driverModel!));
    }).catchError((error) {
      print(error.toString());
      emit(DriverErrorDriverDataState());
    });
  }

  GetChair? chairModel;
  List <Map<String,dynamic>> chair=[];
  void getChairData(int carid) {
    DioHelper.getData(url: GETCHAIR, query: {
      'id':carid,
    }).then((value) {
      chair.clear();
      //chairModel = GetChair.fromJson(value.data);
      for (var item in value.data) {
      //print(item['id']);
     chairModel = GetChair.fromJson(item);
     chair.add(item);
    }
      GetChair stm1 =  GetChair.fromJson(chair[5]);
      print(chair);
     // print(chairModel!.status);
      emit(DriverSuccessChairDataState(chairModel!));
    }).catchError((error) {
      print(error.toString());
      emit(DriverErrorChairDataState());
    });
  }

  DriverStatusModel? driverStatusModel;
  void PutDriverStatus({
    required int id,
    required int value,
  })
  {
    //emit(AppLoadingGrtDataState());
    DioHelper.putData(url:DRIVERSTATUS,
        query: {
        'id':id,
        'value':value,
    }
    ).then((value) {
      driverStatusModel = DriverStatusModel.fromJson(value.data);
      print(value.data);
      emit(DriverSuccessStatusState());
    }).catchError((error) {
      print(error.toString());
      emit(DriverErrorStatusState());
    });
  }


  RestChairsModel? restCharsModel;
  void RestChairs({
    required int id,
  })
  {
    DioHelper.putData(url:RESTCAIR,
        query: {
          'id':id,
        }
    ).then((value) {
      restCharsModel = RestChairsModel.fromJson(value.data);
      print(value.data);
      emit(DriverSuccessRestChairsState());
    }).catchError((error) {
      print(error.toString());
      emit(DriverErrorRestChairsState());
    });
  }

  CarTripsModel? carTripsModel;
  List <Map<String,dynamic>> carTrips=[];
  void getCarTripsData(int carid) {
    DioHelper.getData(url: CARTRIPS, query: {
      'carId':carid,
    }).then((value) {
      //carTripsModel = CarTripsModel.fromJson(value.data);
      for (var item in value.data) {
        //print(item['id']);
        carTripsModel = CarTripsModel.fromJson(item);
        carTrips.add(item);
      }
      CarTripsModel stm1 =  CarTripsModel.fromJson(carTrips[5]);
      //print(carTrips[0]['date']);
      // print(chairModel!.status);
      emit(DriverSuccessCarTripsState(carTripsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(DriverErrorCarTripsState());
    });
  }


  DriversRoleModel? driversRoleModel;
  void getDriverRoleData(
      {
        required String driver_code
      }
      ) {
    emit(DriverLoadingDriverRoleState());
    DioHelper.getData(url: DRIVERSROLE, query: {
      'driver_code': driver_code
    }).then((value) {
      driversRoleModel = DriversRoleModel.fromJson(value.data);
      print('driver role : ${driversRoleModel!.role}');
      emit(DriverSuccessDriverRoleState());
    }).catchError((error) {
      print(error.toString());
      emit(DriverErrorDriverRoleState());
    });
  }

}


