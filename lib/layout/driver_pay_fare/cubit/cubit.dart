import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/driver_pay_fare/cubit/states.dart';
import 'package:pay_fare/models/car_model/get_chair_model.dart';
import 'package:pay_fare/models/driver_model/get_driver_model.dart';
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

  void ChangeActiveVisibility() {
    Active = !Active;
    icon = Active ? Icons.toggle_off : Icons.toggle_on;
    emit(DriverChangeActiveVisibilityState());
  }

  GetDriverModel? driverModel;
  void getDriverData()  {
    //emit(AppLoadingGrtDataState());
     DioHelper.getData(url: GETDRIVER, query: {
      'phone': '${DriverPhone}',
    }).then((value) {
      driverModel = GetDriverModel.fromJson(value.data);
      print('data driver : ${driverModel!.user!.name}');
      emit(DriverSuccessDriverDataState(driverModel!));
    }).catchError((error) {
      print(error.toString());
      emit(DriverErrorDriverDataState());
    });
  }

  GetChair? chairModel;
  List <Map<String,dynamic>> chair=[];
  void getChairData() {
    DioHelper.getData(url: GETCHAIR, query: {
      'id':'10',
    }).then((value) {
      //chairModel = GetChair.fromJson(value.data);
      for (var item in value.data) {
      //print(item['id']);
     chairModel = GetChair.fromJson(item);
     chair.add(item);
    }
      GetChair stm1 =  GetChair.fromJson(chair[5]);
      //print(chairModel!.chairNumber);
     // print(chairModel!.status);
      emit(DriverSuccessChairDataState(chairModel!));
    }).catchError((error) {
      print(error.toString());
      emit(DriverErrorChairDataState());
    });
  }

}



//
// StationModel? stationModel;
// void getStationData() {
//   DioHelper.getData(url: STATION).then((value) {
//     station.clear();
//     for (var item in value.data) {
//       //print(item['id']);
//       stationModel = StationModel.fromJson(item);
//       stationnew.add(item);
//       station.add(stationModel!.name.toString());
//     }
//     //StationModel stm1 =  StationModel.fromJson(stationnew[0]);
//     //print(stm1.id);
//
//
//     emit(AdminSuccessStationState(stationModel!));
//   }).catchError((error) {
//     print(error.toString());
//     emit(AdminErrorStationState());
//   });
// }
