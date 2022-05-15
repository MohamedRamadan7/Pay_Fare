

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/states.dart';
import 'package:pay_fare/models/station_model.dart';
import 'package:pay_fare/models/station_model.dart';
import 'package:pay_fare/modules/admin_pay_fare/Arranging/admin_Arranging_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/add_driver/add_driver_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/home/admin_home_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/reports/admin_reports_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/ticket_price/ticket_price_screen.dart';
import 'package:pay_fare/shared/network/end_points.dart';
import 'package:pay_fare/shared/network/local/cache_helper.dart';
import 'package:pay_fare/shared/network/remote/dio_helper.dart';
import 'package:sqflite/sqflite.dart';

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


  StationModel? stationModel;
  void getStationData()  {
    DioHelper.getData(url: STATION).then((value) {
      stationModel = StationModel.fromJson(value.data);
      print('data driver : ${stationModel!.name}');
      emit(AdminSuccessStationState(stationModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AdminErrorStationState());
    });
  }
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
  //
  // List<Map> ActiveDriver =[];
  //
  // var database;
  // void createDatabase()
  // {
  //   openDatabase(
  //     'todo.db',
  //     version: 1,
  //     onCreate: (database , version)
  //     {
  //       print('database created');
  //
  //       database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT , data TEXT , time TEXT ,status TEXT)').then((value)
  //       {
  //         print('table created');
  //       }).catchError((error)
  //       {
  //         print('Error When Create table ${error.toString()}');
  //       });
  //
  //     },
  //     onOpen: (database)
  //     {
  //       getDataFromDatabase(database);
  //       print('database opened');
  //     },
  //   ).then((value) {
  //     database=value;
  //     emit(AppCreatDatabaseState());
  //   });
  // }
  //
  // insertToDatabase({
  //   required String title,
  //   required String time,
  //   required String date,
  // }) async
  //     {
  //   await database.transaction((txn) async
  //   {
  //
  //
  //     await txn.rawInsert('INSERT INTO tasks (title, data, time ,status) VALUES("$title","$date","$time","new")'
  //     );
  //     print(' inserting successfully');
  //     emit(AppInsertDatabaseState());
  //     getDataFromDatabase(database);
  //
  //     return null;
  //   });
  //
  // }
  //
  // void getActiveDriverData(database)
  // {
  //   ActiveDriver =[];
  //   emit(AdminGetDataLodingState());
  //   database.rawQuery('SELECT * FROM tasks').then((value)
  //   {
  //
  //     value.forEach((element) {
  //       if(element['status'] == 'new')
  //         ActiveDriver.add(element);
  //
  //     });
  //     emit(AppGetDriverDatState());
  //   });
  //
  // }
  //
  // void updateData({
  //   required String status,
  //   required int id
  //
  // }) async
  // {
  //   database.rawUpdate(
  //     'UPDATE tasks SET status = ? WHERE id = ?' ,
  //     ['$status',id],
  //   ).then((value)
  //   {
  //     getDataFromDatabase(database);
  //     emit(AppUpdateDatabaseLodingState());
  //
  //   });
  // }
  // void deleteData({
  //   required int id
  //
  // }) async
  // {
  //   database.rawDelete(
  //     'DELETE FROM tasks  WHERE id = ?' ,
  //     [id],
  //   ).then((value)
  //   {
  //     getDataFromDatabase(database);
  //     emit(AppdeleteDatabaseLodingState());
  //   });
  // }
  //

}
