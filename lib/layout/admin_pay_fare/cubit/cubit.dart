

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/states.dart';
import 'package:pay_fare/models/station_model.dart';
import 'package:pay_fare/modules/admin_pay_fare/Arranging/admin_Arranging_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/add_driver/add_driver_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/home/admin_home_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/reports/admin_reports_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/ticket_price/ticket_price_screen.dart';
import 'package:pay_fare/shared/network/local/cache_helper.dart';
import 'package:pay_fare/shared/network/remote/dio_helper.dart';

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
   List <String> station = [ 'الموقف الجديد','عبود','رمسيس','الاتوبيس الجديد'];

  final from = [ 'Mans','Alex','Cairo','Giza'];
  final to = [ 'Mans','Alex','Cairo','Giza'];
  String? valueStation;
  String? valueFrom;
  String? valueTo;
  String? valueOwner;
 final  owner=[
    'Mohamed Ramadan','Mohamed 3bid','Mohamed AbdElStar', 'Khaled Awad','Zaynb yousef',
  ];


   void onChangedDropdownMenuFrom(value)
   {
     valueFrom=value;
     emit(onChangedDropdownMenuState());
   }
  void onChangedDropdownMenuTo(value)
  {
    valueTo=value;
    emit(onChangedDropdownMenuState());
  }
  void onChangedDropdownMenuStation(value)
  {
    valueStation=value;
    emit(onChangedDropdownMenuState());
  }

  void onChangedDropdownMenuOwner(value)
  {
    valueOwner=value;
    emit(onChangedDropdownMenuState());
  }
}
