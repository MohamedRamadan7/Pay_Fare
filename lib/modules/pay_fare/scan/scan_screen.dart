import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/states.dart';
import 'package:pay_fare/modules/pay_fare/scan/ListViewPage.dart';
import 'package:pay_fare/modules/qr/read_qr_screen.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/components/constants.dart';
import 'package:pay_fare/shared/styles/colors.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ScanScreen extends StatelessWidget {
  var ScanController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    var Cubit =AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is AppScanState)
          {
            AppCubit.get(context).getQrData();
          }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            AppCubit.get(context).scanQr();
                          },
                          icon: Icon(
                            Icons.qr_code_scanner_rounded,
                            size: 35.0,
                            color: defaultColor,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'car id is :  ${AppCubit.get(context).qrstr}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: defaultColor, width: 3),
                            borderRadius: BorderRadius.circular(
                              30.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    //color: defaultColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        reverse: true,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1 / 0.6,
                        children: List.generate(
                          14,
                          (index) => buildGridProducts(index, context),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Divider(thickness: 2, indent: 30, endIndent: 30),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total amount :',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${Cubit.amountToPay}',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'L.E',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Center(
                    child:
                        state is !AppLoadingPayfareState?
                    defaultButton(
                        width: 200,
                        function: () {
                          List givenChairs =[];
                          AppCubit.get(context).chairListTest.forEach((element) {
                            print(element['check']?"${element['index']} is check":"not checked");
                           // print(element['booked']?"${element['index']} is booked":"not booked");

                            if(element['check']&&!element['booked']) givenChairs.add(element['index']+1);

                          });
                          // AppCubit.get(context).colorChair.forEach((key, value) {
                          //   print(key);
                          //   if(value) givenChairs.add(14-key);
                          // });
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => ListViewPage(
                          //           amountToPay: amountToPay,
                          //         )));
                          print(givenChairs);
                          AppCubit.get(context).putPayfare(
                              clientId: int.parse('${AppCubit.get(context).userModel?.id}') ,
                              carId:  int.parse('${AppCubit.get(context).qrModel!.carId}'),
                              driverPhone: '${AppCubit.get(context).qrModel!.driverPhone}',
                              amount: double.parse('${AppCubit.get(context).qrModel!.price! * givenChairs.length}'),
                              chair: givenChairs.reversed.toList());



                        },
                        text: 'pay',
                        isUberCase: true):Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildGridProducts(int index, context) => Container(
        //color:defaultColor,
        child: Column(
          children: [
            !AppCubit.get(context).chairListTest[13-index]['booked']?
            InkWell(

              onTap: () {
                 AppCubit.get(context).changeChair(index);
                // for (var item; item<3 ; item++ )
                // {
                //   AppCubit.get(context).chairs.add(index);
                // }
                // print(AppCubit.get(context).chairs);
                 AppCubit.get(context).chair[index]['status'];
              },
              child: Image.asset(
                'assets/images/car.png',
                height: 50,
                width: double.infinity,
                color: AppCubit.get(context).chairListTest[13-index]['check']||AppCubit.get(context).chairListTest[13-index]['booked']! ? Colors.green : Colors.grey[600],
              ),
            ):Image.asset(
              'assets/images/car.png',
              height: 50,
              width: double.infinity,
              color: AppCubit.get(context).chairListTest[13-index]['check']||AppCubit.get(context).chairListTest[13-index]['booked']! ? Colors.red : Colors.grey[600],
            )
            ,
            Text('chair ${14 - index}'),
          ],
        ),
      );
}
