import 'package:flutter/material.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/styles/colors.dart';

class AdminReportsScreen extends StatelessWidget {
  var CarIdController1 = TextEditingController();
  var CarIdController2 = TextEditingController();
  var CarIdController3 = TextEditingController();
  var CarIdController4 = TextEditingController();
  var CarIdController5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Driver name',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: 20.0,
                ),
                defaultFormFiled(
                    controller: CarIdController1,
                    type: TextInputType.name,
                    lable: 'Car Id',
                    fixIcon:Icons.chevron_right_outlined
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultFormFiled(
                    controller: CarIdController2,
                    type: TextInputType.name,
                    lable: 'Car Id',
                    fixIcon:Icons.chevron_right_outlined
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultFormFiled(
                    controller: CarIdController3,
                    type: TextInputType.name,
                    lable: 'Car Id',
                    fixIcon:Icons.chevron_right_outlined
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultFormFiled(
                    controller: CarIdController4,
                    type: TextInputType.name,
                    lable: 'Car Id',
                    fixIcon:Icons.chevron_right_outlined
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultFormFiled(
                    controller: CarIdController5,
                    type: TextInputType.name,
                    lable: 'Car Id',
                    fixIcon:Icons.chevron_right_outlined
                ),


              ],
            ),
          ),
        )
    );
  }
}
