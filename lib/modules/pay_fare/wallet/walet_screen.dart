import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/states.dart';
import 'package:pay_fare/modules/pay_fare/scan/ListViewPage.dart';
import 'package:pay_fare/modules/pay_fare/wallet/balance_card.dart';
import 'package:pay_fare/modules/pay_fare/wallet/request_credit.dart';
import 'package:pay_fare/modules/pay_fare/wallet/send_credit.dart';
import 'package:pay_fare/modules/pay_fare/wallet/wallet_balance.dart';
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
                              navigateTo(context,SendCreditScreen());
                            },
                            text: 'Send Credit',
                            isUberCase: false,
                            radius: 30,
                            background: LightColor.navyBlue1
                          ),
                          Spacer(),
                          defaultButton(
                            fontSize: 17,
                            width: 150,
                            function: ()
                            {

                              navigateTo(context, RequestCreditScreen());
                            },
                            text: 'Request Credit ',
                            isUberCase: false,
                            radius: 30,
                            background: LightColor.navyBlue1
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
                                  color: Colors.white,
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
                                  Icon(Icons.credit_card,
                                  color: Colors.white,),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Center(
                                    child: Text('Add your card to enjoy your new experience',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
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
                                    navigateTo(context,WalletBalanceScreen());
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
                        color:LightColor.navyBlue1,
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
