

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/states.dart';
import 'package:pay_fare/modules/admin_pay_fare/Arranging/admin_Arranging_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/add_driver/add_driver_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/home/admin_home_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/reports/admin_reports_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/ticket_price/ticket_price_screen.dart';
import 'package:pay_fare/shared/network/local/cache_helper.dart';

class AdminCubit extends Cubit<AdminStates> {
  AdminCubit() : super(AdminInitialState());

  static AdminCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;
  List<Widget> bottomScreen = [
    AdminHomeScreen(),
    AdminArrangingScreen(),
    AdminAddDriverScreen(),
    AdminTicketPriceScreen(),
    AdminReportsScreen(),

  ];

  List<String> titles=
  [
    'Home',
    'Arranging',
    'Add driver',
    'Ticket Price',
    'Reports',

  ];

  void changeBottomNave(index) {
    currentIndex = index;
    emit(AdminChangeBottomNaveState());
  }

  late Map<int, bool> colorChair = {
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

    colorChair[index] =!colorChair[index]!;
    //colorChair.update(index, (value) => !value);
   //CacheHelper.saveData(key: 'chair', value:colorChair[index] );
    CacheHelper.saveData(key: 'chair', value: colorChair[index]!).then((value)
    {
      emit(AdminChangeChairStaState());
    });

  }


}
