

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/states.dart';
import 'package:pay_fare/shared/styles/colors.dart';

class AdminHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit,AdminStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Active Driver',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ) ,
                  SizedBox(
                    height: 20.0,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildActiveDriver(),
                      separatorBuilder: (context, index) =>SizedBox(
                        height: 20,
                      ),
                      itemCount: 10),
                ],
              ),
            ),
        );
      },
    );
  }
  Widget buildActiveDriver() => Padding(
    padding: const EdgeInsets.symmetric(horizontal:10.0),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('Driver Name',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,

                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  Spacer(),
                  Text('Car Id ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,

                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),

          ]
      ),
      decoration: BoxDecoration(
        color: defaultColor,
        // border: Border.all(color: defaultColor,
        //     width: 10),
        borderRadius: BorderRadius.circular(50.0,),
      ),
    ),
  );

}
