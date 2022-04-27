import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/states.dart';



class AdminLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit,AdminStates>(
      listener: (context , state){},
      builder: (context , state){

        var cubit = AdminCubit.get(context);
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
                    Icons.replay,
                  ),
                  label: 'Arranging'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_add,
                  ),
                  label: 'Add driver'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.airplane_ticket_outlined,
                  ),
                  label: 'Ticket Price'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.report,
                  ),
                  label: 'Reports'
              ),

            ],

          ),
        );
      },

    );


  }
}
