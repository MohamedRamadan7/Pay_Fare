import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/states.dart';
import 'package:pay_fare/layout/driver_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/modules/pay_fare/onboarding/on_boarding.dart';
import 'package:pay_fare/shared/components/constants.dart';
import 'package:pay_fare/shared/styles/themes.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();
 clientId = CacheHelper.getData(key: 'clientId');
 DriverPhone = CacheHelper.getData(key: 'driverPhone');
 AdminId = CacheHelper.getData(key: 'adminId');


  runApp(MyApp());
  //
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..getUserData(),
        ),
        BlocProvider(
          create: (BuildContext context) => DriverCubit()..getDriverData()
        ),
        BlocProvider(
          create: (BuildContext context) => AdminCubit()..getStationData()..getOwnerData()..getTrafficData()..getAllQueueData()..getDriversOnline(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (CacheHelper.getData(key: 'balanceClient') != null) {
              AppCubit.get(context).balance =
                  CacheHelper.getData(key: 'balanceClient');
            } else {
              CacheHelper.saveData(key: 'balanceClient', value: 1000.0);
            }
            //clientId = CacheHelper.getData(key: 'clientId');
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              home: OnBoarding(),
            );
          }),
    );
  }
}
