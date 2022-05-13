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
    return BlocConsumer<DriverCubit,DriverStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
            body: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //
                    //   padding: EdgeInsets.symmetric(vertical: 20.0),
                    //   child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children:
                    //       [
                    //         Padding(
                    //           padding: const EdgeInsets.all(5.0),
                    //           child: Row(
                    //             children: [
                    //               CircleAvatar(
                    //                 radius: 25.0,
                    //                 backgroundImage: NetworkImage(
                    //                     'https://play-lh.googleusercontent.com/O6bNpvDPClvYntJEOxbM7w-UNtoJf0Xcj6JyY2zJZOYlkSd8F3AufC20SJXKUncqGxk=s200'),
                    //               ),
                    //               SizedBox(
                    //                 width: 5.0,
                    //               ),
                    //               Text('Mohamed Ramadan',
                    //                 style: TextStyle(
                    //                     fontSize: 18.0,
                    //                     color: Colors.black,
                    //                     fontWeight: FontWeight.bold
                    //                 ),
                    //               ),
                    //               Spacer(),
                    //               Text('Car Id',
                    //                 style: TextStyle(
                    //                     fontSize: 18.0,
                    //                     color: Colors.black,
                    //                     fontWeight: FontWeight.bold
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 20,
                    //         ),
                    //         Text('currant balance',
                    //           style: TextStyle(
                    //             fontSize: 20.0,
                    //             color: Colors.black,
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 15.0,
                    //         ),
                    //         Row(
                    //           crossAxisAlignment: CrossAxisAlignment.end,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text('00.00',
                    //               style: TextStyle(
                    //                 fontSize: 25.0,
                    //                 color: Colors.black,
                    //               ),
                    //             ),
                    //             Text('L.E',
                    //               style: TextStyle(
                    //                 fontSize: 15.0,
                    //                 fontWeight: FontWeight.w600,
                    //                 color: Colors.black,
                    //               ),
                    //             ),
                    //
                    //           ],
                    //         ),
                    //
                    //
                    //       ]
                    //   ),
                    //   decoration: BoxDecoration(
                    //     color: MyColors.lightGrey,
                    //     border: Border.all(color: defaultColor,
                    //         width: 10),
                    //     borderRadius: BorderRadius.circular(20.0,),
                    //   ),
                    // ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(
                              'https://play-lh.googleusercontent.com/O6bNpvDPClvYntJEOxbM7w-UNtoJf0Xcj6JyY2zJZOYlkSd8F3AufC20SJXKUncqGxk=s200'),
                        ),

                        SizedBox(
                          width: 5.0,
                        ),
                        Text('Mohamed Ramadan',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Text('Car Id',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:20.0 ,),
                    BalanceCard(balance: 0),
                    SizedBox(
                      height:20.0 ,),
                    Text('Station',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height:20.0 ,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: (){
                                        DriverCubit.get(context).ChangeActiveVisibility();
                                      },
                                      icon: Icon(DriverCubit.get(context).icon,
                                        color:DriverCubit.get(context).Active? Colors.grey:defaultColor,
                                        size: 40,)),

                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('Activity station ',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,

                                      color: Colors.white,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Spacer(),
                                  Text('Your turn ',
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

                          ]
                      ),
                      decoration: BoxDecoration(
                        color: LightColor.navyBlue1,
                        // border: Border.all(color: defaultColor,
                        //     width: 10),
                        borderRadius: BorderRadius.circular(20.0,),
                      ),
                    ),

                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
