import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/states.dart';
import 'package:pay_fare/modules/pay_fare/scan/ListViewPage.dart';
import 'package:pay_fare/modules/qr/read_qr_screen.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/styles/colors.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ScanScreen extends StatelessWidget {
  var ScanController = TextEditingController();
  double amountToPay = 30.0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
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
                            '$amountToPay',
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
                    child: defaultButton(
                        width: 200,
                        function: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ListViewPage(
                                    amountToPay: amountToPay,
                                  )));

                          //  navigateTo(context, widget);
                        },
                        text: 'pay',
                        isUberCase: true),
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
            InkWell(
              onTap: () {
                print(index);
                AppCubit.get(context).changeChair(index);
                print(AppCubit.get(context).colorChair[index]);
              },
              child: Image.asset(
                'assets/images/car.png',
                height: 50,
                width: double.infinity,
                color: AppCubit.get(context).colorChair[index]!
                    ? Colors.green
                    : Colors.grey[600],
              ),
            ),
            Text('chair ${14 - index}'),
          ],
        ),
      );
}
