import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/states.dart';
import 'package:pay_fare/modules/pay_fare/scan/ListViewPage.dart';
import 'package:pay_fare/shared/components/components.dart';
class RequestCreditScreen extends StatelessWidget {
  const  RequestCreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fundsController = TextEditingController();
    var numberController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Send Credit'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                defaultFormFiled(
                  controller: fundsController,
                  type: TextInputType.number,
                  validation: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your Funds';
                    }
                  },
                  lable: 'Add Funds',
                  fixIcon: Icons.money,
                    onsumit: (value) {}
                ),
                SizedBox(
                  height: 30,
                ),
                defaultFormFiled(
                  controller: fundsController,
                  type: TextInputType.number,
                  validation: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your Number';
                    }
                  },
                  lable: 'Phone Number',
                  fixIcon: Icons.phone,
                    onsumit: (value) {}
                ),
                SizedBox(
                  height: 30,
                ),
                defaultButton(
                    radius: 30,
                    function: () {
                      navigateTo(context,ListViewPage(amountToPay: double.parse(numberController.text)));
                    },
                    text: 'Next')
//
              ],
            ),
          ),
        );
      },
    );
  }
}
