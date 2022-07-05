import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/states.dart';
import 'package:pay_fare/models/station_model.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/components/title_text.dart';
import 'package:pay_fare/shared/network/remote/dio_helper.dart';

class AdminAddDriverScreen extends StatelessWidget {

  var  driverNameController =TextEditingController();
  var phoneController = TextEditingController();
  var licenseNumberController =TextEditingController();
  var  carCapacityController =TextEditingController();
  var plateNumberController = TextEditingController();
  var ownerController =TextEditingController();
  // var stationController = TextEditingController();
  // var fromController = TextEditingController();
  // var toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit,AdminStates>(
        listener: (context , state){},
        builder: (context , state){
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Column(
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
                        defaultFormFiled(
                            controller: licenseNumberController,
                            type: TextInputType.number,
                            lable: 'License Number',
                            fixIcon:Icons.credit_card
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TitleText(text: 'car',),
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: [
                        defaultFormFiled(
                            controller: plateNumberController,
                            type: TextInputType.visiblePassword,
                            lable: 'Plate Number',
                            fixIcon:Icons.directions_car
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormFiled(
                            controller: carCapacityController,
                            type: TextInputType.number,
                            lable: 'Car Capacity',
                            fixIcon:Icons.reduce_capacity
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black,width: 1)
                      ),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text('owner'),
                              iconSize: 36,
                              value: AdminCubit.get(context).valueOwner,
                              items: AdminCubit.get(context).owner.map(buildMenuItem).toList(),
                              onChanged: (value)=>AdminCubit.get(context).onChangedDropdownMenuOwner(value)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black,width: 1)
                      ),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            // onTap: (){
                            //   DioHelper.getData(url: 'station').then((value) {
                            //     StationModel st =StationModel.fromJson(value.data[0]);
                            //     print(st.name);
                            //     AdminCubit.get(context).station;
                            //   });
                            // },
                              isExpanded: true,
                              hint: Text('Station'),
                              iconSize: 36,
                              value: AdminCubit.get(context).valueStation,
                              items: AdminCubit.get(context).station.map(buildMenuItem).toList(),
                              onChanged: (value)=>AdminCubit.get(context).onChangedDropdownMenuStation(value)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [

                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black,width: 1)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                  alignedDropdown: true,
                                child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Text('From'),
                                    iconSize: 36,
                                    value: AdminCubit.get(context).valueFrom,
                                    items: AdminCubit.get(context).from.map(buildMenuItem).toList(),
                                    onChanged: (value)=>AdminCubit.get(context).onChangedDropdownMenuFrom(value)
                                ),
                              ),
                            ),
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
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black,width: 1)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                              alignedDropdown: true,
                                child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Text('To'),
                                    iconSize: 36,
                                    value: AdminCubit.get(context).valueTo,
                                    items: AdminCubit.get(context).to.map(buildMenuItem).toList(),
                                    onChanged: (value)=>AdminCubit.get(context).onChangedDropdownMenuTo(value)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: state is !AdminPostDriverLoadingState ? defaultButton(
                          width: 200,
                          function: ()
                          {
                            //AdminCubit.get(context).getStationData();
                            //AdminCubit.get(context).getOwnerData();
                            //AdminCubit.get(context).getTrafficData();


                            AdminCubit.get(context).driverRegister(
                                name: driverNameController.text,
                                username: phoneController.text,
                                phone: phoneController.text,
                                liceNum: licenseNumberController.text
                            );

                            AdminCubit.get(context).PostCar(
                                carPlateNum: plateNumberController.text,
                                carCapacity: carCapacityController.text,
                                qrCode: plateNumberController.text
                            );
                          },

                          text: 'Save',
                          isUberCase: false
                      ):Center(child: CircularProgressIndicator()),

                    )

                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  DropdownMenuItem<String>buildMenuItem (String item)=>DropdownMenuItem(
    value: item,
      child: Text(item,
        style: TextStyle(
          fontSize: 20
        ),

      )
  );
}
