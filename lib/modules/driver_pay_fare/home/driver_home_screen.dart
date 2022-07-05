import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/driver_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/driver_pay_fare/cubit/states.dart';
import 'package:pay_fare/modules/pay_fare/wallet/balance_card.dart';
import 'package:pay_fare/shared/components/title_text.dart';
import 'package:pay_fare/shared/styles/colors.dart';

class DriverHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double? balance = double.parse('${cubit.driverModel!.amount }');
    return BlocConsumer<DriverCubit, DriverStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = DriverCubit.get(context);
        return Scaffold(
          body: state is DriverSuccessDriverDataState ||
                  state is DriverSuccessChairDataState ||
                  state is DriverChangeBottomNaveState||
                  state is DriverSuccessCarTripsState||
                  state is DriverSuccessStatusState||
                  state is  DriverSuccessDriverRoleState
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-blue-shirt-clothes-fashion-man-posing_158538-4976.jpg?t=st=1656436994~exp=1656437594~hmac=111888a230516604ecfef03bb5d10bb262fd0fc48b34061a8b4e65b55b29bfcc&w=740'),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${cubit.driverModel!.user!.name}',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Text(
                              'Car Id : ${cubit.driverModel!.car!.id}',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        BalanceCard(
                            balance:
                                double.parse('${cubit.driverModel!.amount}')),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Station',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            DriverCubit.get(context)
                                                .ChangeActiveVisibility();
                                            DriverCubit.get(context)
                                                .PutDriverStatus(
                                                    id: int.parse(
                                                        '${DriverCubit.get(context).driverModel!.id}'),
                                                    value:
                                                        DriverCubit.get(context)
                                                            .value);
                                            DriverCubit.get(context)
                                                .getDriverRoleData(
                                                    driver_code:
                                                        '${DriverCubit.get(context).driverModel!.driverCode}');
                                          },
                                          icon: Icon(
                                            DriverCubit.get(context).icon,
                                            color:
                                                DriverCubit.get(context).Active
                                                    ? Colors.grey
                                                    : defaultColor,
                                            size: 40,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        'Activity station ',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,

                                          color: Colors.white,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        // 'Your turn ',
                                        'Your turn ${cubit.driversRoleModel?.role ?? ''}',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,

                                          color: Colors.white,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                          decoration: BoxDecoration(
                            color: LightColor.navyBlue1,
                            // border: Border.all(color: defaultColor,
                            //     width: 10),
                            borderRadius: BorderRadius.circular(
                              20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
