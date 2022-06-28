import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/driver_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/driver_pay_fare/cubit/states.dart';

class DriverLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit,DriverStates>(
      listener: (context , state)
      {
        if(state is DriverSuccessDriverDataState)
        DriverCubit.get(context).getChairData(int.parse('${DriverCubit.get(context).driverModel!.car!.id}'));
      },
      builder: (context , state){

        var cubit = DriverCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),

          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:cubit.currentIndex ,
            onTap:(index)
            {
              cubit.changeBottomNave(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
              Icons.home,
          ),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications ,
                  ),
                  label: 'P.notifications'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_balance_wallet_outlined,
                  ),
                  label: 'Wallet'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive,
                  ),
                  label: 'Archive'
              ),
            ],

          ),
        );
      },

    );


  }
}
