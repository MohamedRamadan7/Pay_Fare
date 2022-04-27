
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/driver_pay_fare/cubit/states.dart';
import 'package:pay_fare/modules/driver_pay_fare/archive/driver_archive_screen.dart';
import 'package:pay_fare/modules/driver_pay_fare/home/driver_home_screen.dart';
import 'package:pay_fare/modules/driver_pay_fare/notifications/notification_screen.dart';
import 'package:pay_fare/modules/driver_pay_fare/wallet/driver_walet_screen.dart';

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

  List<String> titles=
  [
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

  IconData icon= Icons.toggle_off;
  bool Active=true;

  void ChangeActiveVisibility()
  {
    Active= !Active;
    icon= Active? Icons.toggle_off :Icons.toggle_on;
    emit(DriverChangeActiveVisibilityState());
  }


}
