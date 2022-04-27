import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/states.dart';


class AppLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context , state){},
      builder: (context , state){

        var cubit = AppCubit.get(context);
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
                    Icons.qr_code_scanner_rounded ,
                  ),
                  label: 'Scan'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.help,
                  ),
                  label: 'Help'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_balance_wallet_outlined,
                  ),
                  label: 'Wallet'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile'
              ),
            ],

          ),
        );
      },

    );


  }
}
