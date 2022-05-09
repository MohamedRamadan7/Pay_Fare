import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/states.dart';
import 'package:pay_fare/modules/pay_fare/help/help_screen.dart';
import 'package:pay_fare/modules/pay_fare/home/home_screen.dart';
import 'package:pay_fare/modules/pay_fare/profile/profile_screen.dart';
import 'package:pay_fare/modules/pay_fare/scan/scan_screen.dart';
import 'package:pay_fare/modules/pay_fare/wallet/walet_screen.dart';
import 'package:pay_fare/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;
  List<Widget> bottomScreen = [
    HomeScreen(),
    ScanScreen(),
    HelpScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];

  List<String> titles=
  [
    'Home',
    'Scan',
    'Help',
    'Wallet',
    'Profile',
  ];

  void changeBottomNave(index) {
    currentIndex = index;
    emit(AppChangeBottomNaveState());
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
    colorChair[index]= !colorChair[index]!;
    //colorChair.update(index, (value) => !value);
   //CacheHelper.saveData(key: 'chair', value:colorChair[index] );
    CacheHelper.saveData(key: 'chair', value: colorChair[index]!).then((value)
    {
      emit(AppChangeChairStaState());
    });

  }

  var qrstr = "let's Scan it";

  Future <void>scanQr()async{
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        qrstr=value;
        emit(AppScanState());
      });
    }catch(e){

      qrstr='unable to read this';
      emit(AppScanErrorState());
    }
  }



}
