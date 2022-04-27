import 'package:flutter/material.dart';
import 'package:pay_fare/shared/components/components.dart';

class AdminTicketPriceScreen extends StatelessWidget {

  var fromController = TextEditingController();
  var toController = TextEditingController();
  var costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [

                  Image.asset('assets/images/travel.png',width: 50,),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Travel Cost',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
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
                  Expanded(
                    child: defaultFormFiled(
                      controller: costController,
                      type: TextInputType.number,
                      lable: 'Cost',

                    ),
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
                height: 30,
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
                  Expanded(
                    child: defaultFormFiled(
                      controller: costController,
                      type: TextInputType.number,
                      lable: 'Cost',

                    ),
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
                height: 30,
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
                  Expanded(
                    child: defaultFormFiled(
                      controller: costController,
                      type: TextInputType.number,
                      lable: 'Cost',

                    ),
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
                height: 30,
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
                  Expanded(
                    child: defaultFormFiled(
                      controller: costController,
                      type: TextInputType.number,
                      lable: 'Cost',

                    ),
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
                height: 30,
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
                  Expanded(
                    child: defaultFormFiled(
                      controller: costController,
                      type: TextInputType.number,
                      lable: 'Cost',

                    ),
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
                height: 30,
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
                  Expanded(
                    child: defaultFormFiled(
                      controller: costController,
                      type: TextInputType.number,
                      lable: 'Cost',

                    ),
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
                height: 30,
              ),
              Center(
                child: defaultButton(
                    width: 150,
                    function: ()
                    {
                      //  navigateTo(context, widget);
                    },
                    text: 'Save',
                    isUberCase: false
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
