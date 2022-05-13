import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/states.dart';
import 'package:pay_fare/modules/pay_fare/wallet/balance_card.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/styles/colors.dart';

class WalletScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
    builder: (context, state) {
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   width: double.infinity,
                    //   height: 150,
                    //
                    //   padding: EdgeInsets.all( 35.0),
                    //   child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children:
                    //       [
                    //
                    //         Text('currant balance',
                    //           style: TextStyle(
                    //             fontSize: 20.0,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.black,
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 25.0,
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
                    //           ],
                    //         ),
                    //
                    //       ]
                    //   ),
                    //   decoration: BoxDecoration(
                    //     // border: Border.all(color: defaultColor,
                    //     //     width: 10),
                    //     color: defaultColor,
                    //     borderRadius: BorderRadius.circular(20.0,),
                    //   ),
                    // ),
                    BalanceCard(balance: AppCubit.get(context).balance),
                    SizedBox(
                      height:50.0 ,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          defaultButton(
                            width: 150,
                            fontSize: 17,
                            function: ()
                            {
                              //  navigateTo(context, widget);
                            },
                            text: 'Balance trans',
                            isUberCase: false,
                            radius: 30,
                          ),
                          Spacer(),
                          defaultButton(
                            fontSize: 17,
                            width: 150,
                            function: ()
                            {
                              //  navigateTo(context, widget);
                            },
                            text: 'Credit request',
                            isUberCase: false,
                            radius: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:50.0 ,),
                    Container(
                      width: double.infinity,
                      height: 170,
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('credit',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(Icons.credit_card),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Center(
                                    child: Text('Add your card to enjoy your new experience',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Center(
                              child: defaultButton(
                                fontColor: defaultColor,
                                background: Colors.white,
                                width: 150,
                                function: ()
                                {
                                  //  navigateTo(context, widget);
                                },
                                text: 'Add Credit',
                                isUberCase: false,
                                radius: 30,
                              ),
                            ),
                          ]
                      ),
                      decoration: BoxDecoration(
                        // border: Border.all(color: defaultColor,
                        //     width: 10),
                        color: defaultColor,
                        borderRadius: BorderRadius.circular(20.0,),
                      ),
                    ),

                  ],
                ),
              )
          );
    }

    );
  }
}
