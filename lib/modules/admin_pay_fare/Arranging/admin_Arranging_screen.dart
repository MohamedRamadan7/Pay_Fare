import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/states.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/styles/colors.dart';

class AdminArrangingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AdminCubit,AdminStates>(
      listener: (context,states){},
      builder: (context,states){
        var length = AdminCubit.get(context).DriversOnline.length;
        return Scaffold(

          body:  SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                length > 0 ? ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildArranging(context, index),
                    separatorBuilder: (context, index) =>SizedBox(
                      height: 20,
                    ),
                    itemCount:length ) : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.menu,
                        size: 80.0,
                        color: Colors.grey,),
                      Text(' No Drivers in the Station ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

        );
      },
    );
  }

  Widget buildArranging(context, index) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Row(
      children: [
        Container(
          child: defaultButton(
          width: 115,
          fontColor: Colors.black,
          fontSize: 16.0,
          background: Colors.white,
          function: ()
          {
            AdminCubit.get(context).PostDriverInQueue(driver_code:AdminCubit.get(context).DriversOnline[index]['driverCode']);
          },
          text: 'The Turn',
          isUberCase: false,
            radius: 15
    ),
          decoration: BoxDecoration(
            // color: defaultColor,
            border: Border.all(color: defaultColor,
                width: 2),
            borderRadius: BorderRadius.circular(15.0,),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width:230,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text(' ${AdminCubit.get(context).DriversOnline[index]['user']['name']} ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,

                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text('Car Id: ${AdminCubit.get(context).DriversOnline[index]['car']['carPlateNum']} ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,

                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ]
            ),
          ),
          decoration: BoxDecoration(
            // color: defaultColor,
            border: Border.all(color: defaultColor,
                width: 2),
            borderRadius: BorderRadius.circular(15.0,),
          ),
        )
      ],
    ),
  );
}
