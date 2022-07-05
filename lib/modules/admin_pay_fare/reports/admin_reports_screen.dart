import 'package:flutter/material.dart';
import 'package:pay_fare/modules/qr/create_qr_screen.dart';
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

                5> 0? ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildReports(),
                    separatorBuilder: (context, index) =>SizedBox(
                      height: 20,
                    ),
                    itemCount: 5):Center(
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
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: defaultButton(function: ()
                  {
                    navigateTo(context, CreateQrScreen());
                  },
                      width: 200,
                      background: defaultColor,
                      fontColor: Colors.white,
                      isUberCase: false,
                      text: 'Create Qr Code'),
                )
              ],
            ),
          ),
        )
    );
  }

  Widget buildReports() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:
      [
        SizedBox(
          height: 20.0,
        ),
        defaultFormFiled(
            controller: CarIdController1,
            type: TextInputType.name,
            lable: 'Car Id',
            fixIcon:Icons.chevron_right_outlined
        ),

      ]
  );


}
