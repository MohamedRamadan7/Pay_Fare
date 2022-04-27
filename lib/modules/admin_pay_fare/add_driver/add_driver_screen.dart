import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_fare/shared/components/components.dart';

class AdminAddDriverScreen extends StatelessWidget {

  var  driverNameController =TextEditingController();
  var phoneController = TextEditingController();
  var CarIdController = TextEditingController();
  var fromController = TextEditingController();
  var toController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            defaultFormFiled(
                controller: driverNameController,
                type: TextInputType.name,
                lable: 'Driver name',
                fixIcon:Icons.person
            ),
            SizedBox(
              height: 20.0,
            ),
            defaultFormFiled(
                controller: phoneController,
                type: TextInputType.number,
                lable: 'Phone Number',
                fixIcon:Icons.phone
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [

                Expanded(
                  child: defaultFormFiled(
                      controller: fromController,
                      type: TextInputType.name,
                      lable: 'From',
                      fixIcon:Icons.directions_bus
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Destination',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(Icons.compare_arrows)

                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: defaultFormFiled(
                      controller: toController,
                      type: TextInputType.name,
                      lable: 'To ',
                      fixIcon:Icons.directions_bus,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),

            defaultFormFiled(
                controller: CarIdController,
                type: TextInputType.number,
                lable: 'Car Id',
                fixIcon:Icons.chevron_right_outlined
            ),
            SizedBox(
              height: 20.0,
            ),

            Center(
              child: defaultButton(
                  width: 200,
                  function: ()
                  {
                    //  navigateTo(context, widget);
                  },
                  text: 'Add license',
                  isUberCase: false
              ),
            )

          ],
        ),
      ),
    );
  }

}
