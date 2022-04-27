import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/client_pay_fare/cubit/states.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/styles/colors.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';


class DriverNotificationsScreen extends StatelessWidget {


  var ScanController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener:(context, state){} ,
      builder: (context, state){
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Seats ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                    ),
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
                        physics:NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        reverse: true,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1/0.6,
                        children:List.generate(14,
                              (index) =>buildGridProducts(index,context),
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Divider(thickness: 2,indent: 30,endIndent: 30),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: defaultButton(
                      radius: 30,
                        width: 180,
                        function: ()
                        {
                          //  navigateTo(context, widget);
                        },
                        text: ''
                            'reset',
                        isUberCase: true
                    ),
                  ),
                ],
              ),
            ),
          ),

        );
      },

    );
  }

  Widget buildGridProducts (int index ,context) => Container(
    //color:defaultColor,
    child: Column(
      children: [
        // MultiSelectDialogField(
        //   items: _items,
        //   title: Text("Chair"),
        //   selectedColor: Colors.green,
        //   decoration: BoxDecoration(
        //     color: Colors.green.withOpacity(0.1),
        //     borderRadius: BorderRadius.all(Radius.circular(40)),
        //     border: Border.all(
        //       color: Colors.green,
        //       width: 2,
        //     ),
        //   ),
        //   buttonIcon: Icon(
        //     Icons.pets,
        //     color: Colors.green,
        //   ),
        //   buttonText: Text(
        //     "Favorite Chair",
        //     style: TextStyle(
        //       color: Colors.green[800],
        //       fontSize: 16,
        //     ),
        //   ),
        //   onConfirm: (results) {
        //     //_selectedAnimals = results;
        //   },
        // ),


        InkWell(
          onTap: (){
            print(index);
            AppCubit.get(context).changeChair(index);

          },
          child: Image.asset('assets/images/car.png',
            height: 50,
            width:  double.infinity,
            color: AppCubit.get(context).colorChair[index]!?Colors.green:Colors.grey[600],

          ),
        ),
      ],
    ),
  );
}

