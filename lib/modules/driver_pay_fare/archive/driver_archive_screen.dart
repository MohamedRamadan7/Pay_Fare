import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/driver_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/driver_pay_fare/cubit/states.dart';
import 'package:pay_fare/shared/styles/colors.dart';

class DriverArchiveScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit,DriverStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(

          body:  SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildArchive(context,index),
                    separatorBuilder: (context, index) =>SizedBox(
                      height: 10,
                    ),
                    itemCount: DriverCubit.get(context).carTrips.length),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildArchive(context,index) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text('Ride Number ',
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        Text('${index+1} ',
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration:BoxDecoration(
                    color: LightColor.grey,
                    // border: Border.all(color: defaultColor,
                    //     width: 10),
                    borderRadius: BorderRadius.circular(20.0,),
                  ) ,

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text('Date of Ride ',
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        Text('${DriverCubit.get(context).carTrips[index]['date']}',
                          style: TextStyle(
                            fontSize: 18.0,
                            // fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration:BoxDecoration(
                    color: LightColor.grey,
                    // border: Border.all(color: defaultColor,
                    //     width: 10),
                    borderRadius: BorderRadius.circular(15.0,),
                  ) ,

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text('Total Amount ',
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        Text('${DriverCubit.get(context).carTrips[index]['price']} ',
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration:BoxDecoration(
                    color: LightColor.grey,
                    // border: Border.all(color: defaultColor,
                    //     width: 10),
                    borderRadius: BorderRadius.circular(20.0,),
                  ) ,

                ),
              ),

            ]
        ),
      ),
      decoration: BoxDecoration(
        color: LightColor.navyBlue1,
        // border: Border.all(color: defaultColor,
        //     width: 10),
        borderRadius: BorderRadius.circular(20.0,),
      ),
    ),
  );
}
