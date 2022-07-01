import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/states.dart';
import 'package:pay_fare/models/car_model/post_car_model.dart';
import 'package:pay_fare/models/driver_model/change_status_drive_model.dart';
import 'package:pay_fare/models/driver_model/post_driver_miodel.dart';
import 'package:pay_fare/models/owner_model/add_driver_inqueue_model.dart';
import 'package:pay_fare/models/owner_model/drivers_online_model.dart';
import 'package:pay_fare/models/owner_model/owner_model.dart';
import 'package:pay_fare/models/owner_model/remove_from-queue-model.dart';
import 'package:pay_fare/models/station_model.dart';
import 'package:pay_fare/models/trafic_model/trafic_model.dart';
import 'package:pay_fare/modules/admin_pay_fare/Arranging/admin_Arranging_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/add_driver/add_driver_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/home/admin_home_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/reports/admin_reports_screen.dart';
import 'package:pay_fare/modules/admin_pay_fare/ticket_price/ticket_price_screen.dart';
import 'package:pay_fare/shared/network/end_points.dart';
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

  List<String> titles = [
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

  List<String> station = [];
  List <Map<String,dynamic>> stationnew = [];

  List<String> from = [];
  List<String> to = [];
  String? valueStation;
  String? valueFrom;
  String? valueTo;
  String? valueOwner;
  List<String> owner = [];

  StationModel? stationModel;
  void getStationData() {
    DioHelper.getData(url: STATION).then((value) {
      station.clear();
      for (var item in value.data) {
        //print(item['id']);
        stationModel = StationModel.fromJson(item);
        stationnew.add(item);
        station.add(stationModel!.name.toString());
      }
      //StationModel stm1 =  StationModel.fromJson(stationnew[0]);
      //print(stm1.id);


      emit(AdminSuccessStationState(stationModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AdminErrorStationState());
    });
  }

  OwnerModel? ownerModel;
  void getOwnerData() {
    DioHelper.getData(url: OWNER).then((value) {
      owner.clear();
      for (var item in value.data) {
        //print(item['id']);
        ownerModel = OwnerModel.fromJson(item);
        //stationnew.add(item);
        owner.add(ownerModel!.fullName.toString());
        print(owner);
      }
      //StationModel stm1 =  StationModel.fromJson(stationnew[0]);
      //print(stm1.id);


      emit(AdminSuccessOwnerState(ownerModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AdminErrorOwnerState());
    });
  }

  TraficModel? traficmodel;
  void getTrafficData() {
    DioHelper.getData(url: TRAFFIC).then((value) {
      from.clear();
      to.clear();
      for (var item in value.data) {
        //print(item['id']);
        traficmodel = TraficModel.fromJson(item);
        //stationnew.add(item);
        from.add(traficmodel!.from.toString());
        to.add(traficmodel!.to.toString());
        print(from);
        print(to);
      }
      //StationModel stm1 =  StationModel.fromJson(stationnew[0]);
      //print(stm1.id);

      emit(AdminSuccessTrafficState(traficmodel!));
    }).catchError((error) {
      print(error.toString());
      emit(AdminErrorTrafficState());
    });
  }

  void onChangedDropdownMenuFrom(value) {
    valueFrom = value;
    emit(onChangedDropdownMenuState());
  }

  void onChangedDropdownMenuTo(value) {
    valueTo = value;
    emit(onChangedDropdownMenuState());
  }

  void onChangedDropdownMenuStation(value) {
    valueStation = value;
    emit(onChangedDropdownMenuState());
  }

  void onChangedDropdownMenuOwner(value) {
    valueOwner = value;
    emit(onChangedDropdownMenuState());
  }

  List pricies = [
    {
      "cityfrom": "mansoura",
      "cityto": "cairo",
      "price": 10,
    },
    {
      "cityfrom": "mansoura",
      "cityto": "Alex",
      "price": 22,
    },
    {
      "cityfrom": "mansoura",
      "cityto": "tanta",
      "price": 33,
    },
    {
      "cityfrom": "mansoura",
      "cityto": "Giza",
      "price": 44,
    },
    {
      "cityfrom": "mansoura",
      "cityto": "6 octobar",
      "price": 38,
    },
  ];

  void changePrice(index, value) {
    pricies[index]["price"] = value;
    emit(changePriceState());
  }


  PostDriver? postDriverModel;
  void driverRegister({
    required String name,
    required String username,
    required String phone,
    required String liceNum,
  })
  {

    DioHelper.postData(url: POSTDRIVER,
        data:{
          'liceNum':liceNum,
          'user':{
            'name':name,
            'userName':username,
            'phone':phone,
          }
        }
    ).then((value){
      print(value.data);
      postDriverModel = PostDriver.fromJson(value.data);

      emit(AdminPostDriverSuccessState(postDriverModel!));
    }).catchError((error){

      emit(AdminPostDriverErrorState(error.toString()));
      print('error is = ${error.toString()}');
    });
  }

  PostCarModel? postCarModel;
  void PostCar({
    required String carPlateNum,
    required String carCapacity,
    required String qrCode,
  })
  {

    DioHelper.postData(url: POSTCAR,
        data:{
          'carPlateNum':carPlateNum,
          'carCapacity':carCapacity,
          'qrCode':qrCode,
        }
    ).then((value){
      print(value.data);
      postCarModel = PostCarModel.fromJson(value.data);

      emit(AdminPostCarSuccessState(postCarModel!));
    }).catchError((error){

      emit(AdminPostCarErrorState(error.toString()));
      print('error is = ${error.toString()}');
    });
  }


  AddDriverInQueueModel? addDriverInQueueModel;
  void PostDriverInQueue({
    required String driver_code,
  })
  {
    DioHelper.postData(url: ADDINQUEUE,
        query:{
          'driver_code':driver_code,
        }
    ).then((value){
      print(value.data);
      addDriverInQueueModel = AddDriverInQueueModel.fromJson(value.data);
      emit(AdminSuccessDriverInQueueState(addDriverInQueueModel!));
    }).catchError((error){

      emit(AdminErrorDriverInQueueState(error.toString()));
      print('error is = ${error.toString()}');
    });

  }

  List <Map<String,dynamic>> AllDriverInQueue = [];
  void getAllQueueData() {
    DioHelper.getData(url: QUEUE).then((value) {
      AllDriverInQueue.clear();
      for (var item in value.data) {
        //print(item['id']);
       addDriverInQueueModel = AddDriverInQueueModel.fromJson(item);
        AllDriverInQueue.add(item);
      }
      //print(AllDriverInQueue);
      emit(AdminSuccessAllQueueDataState(addDriverInQueueModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AdminErrorAllQueueDataState(error.toString()));
    });
  }


  RemoveFromQueueModel? removeFromQueueModel;
  void RemoveFromQueue({
    required int adminId,
  })
  {
    //emit(AppLoadingGrtDataState());
    DioHelper.deleteData(url:DELETEFROMQUEUE, query: {
      'adminId':adminId,

    }
    ).then((value) {
      removeFromQueueModel = RemoveFromQueueModel.fromJson(value.data);
      print(value.data);
      emit(AdminSuccessRemoveFromQueueState());
    }).catchError((error) {
      print(error.toString());
      emit(AdminErrorRemoveFromQueueState());
    });
  }


  DriversOnlineModel? driversOnlineModel;
  List <Map<String,dynamic>>  DriversOnline = [];
  List <int> DriversID=[];
  void getDriversOnline() {
    DioHelper.getData(url: DRIVERSONLINE).then((value) {
      DriversOnline.clear();
      for (var item in value.data) {
        //print(item['id']);
        driversOnlineModel = DriversOnlineModel.fromJson(item);
        DriversOnline.add(item);
        DriversID.add(driversOnlineModel!.id!);
      }
      //print(DriversOnline);
      emit(AdminSuccessDriversOnlineState(driversOnlineModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AdminErrorDriversOnlineState(error.toString()));
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
      emit(AdminSuccessStatusState());
    }).catchError((error) {
      print(error.toString());
      emit(AdminErrorStatusState());
    });
  }
  List<String> images=[
    'https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-blue-shirt-clothes-fashion-man-posing_158538-4976.jpg?t=st=1656436994~exp=1656437594~hmac=111888a230516604ecfef03bb5d10bb262fd0fc48b34061a8b4e65b55b29bfcc&w=740',
    'https://img.freepik.com/free-photo/portrait-handsome-young-man-makes-okay-gesture-demonstrates-agreement-likes-idea-smiles-happily-wears-optical-glasses-yellow-hat-t-shirt-models-indoor-its-fine-thank-you-hand-sign_273609-30676.jpg?t=st=1656436994~exp=1656437594~hmac=d8a4af4705a65dfa3d1853498dc783f3c449ff94e27731085fe19d3dc9eeb07c&w=740',
     'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1656433434~exp=1656434034~hmac=a4309cb60dd6faa6555d45f3907ebb33e4ec7e635a5aaa7e28e0b1296ac7eab4&w=740',
    'https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-hipster-lumbersexual-businessman-model-man-dressed-jeans-jacket-clothes_158538-1733.jpg?t=st=1656436994~exp=1656437594~hmac=b341001ddc25110aa37e4a4ae18684e3f040543bfc7395daff11050a5e1a2476&w=740',
    'https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-blue-shirt-clothes-fashion-man-posing_158538-4976.jpg?t=st=1656436994~exp=1656437594~hmac=111888a230516604ecfef03bb5d10bb262fd0fc48b34061a8b4e65b55b29bfcc&w=740',
    'https://img.freepik.com/free-photo/portrait-handsome-young-man-makes-okay-gesture-demonstrates-agreement-likes-idea-smiles-happily-wears-optical-glasses-yellow-hat-t-shirt-models-indoor-its-fine-thank-you-hand-sign_273609-30676.jpg?t=st=1656436994~exp=1656437594~hmac=d8a4af4705a65dfa3d1853498dc783f3c449ff94e27731085fe19d3dc9eeb07c&w=740',
    'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1656433434~exp=1656434034~hmac=a4309cb60dd6faa6555d45f3907ebb33e4ec7e635a5aaa7e28e0b1296ac7eab4&w=740',
    'https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-hipster-lumbersexual-businessman-model-man-dressed-jeans-jacket-clothes_158538-1733.jpg?t=st=1656436994~exp=1656437594~hmac=b341001ddc25110aa37e4a4ae18684e3f040543bfc7395daff11050a5e1a2476&w=740',
  ];

}
