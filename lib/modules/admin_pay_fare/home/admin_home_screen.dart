

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/states.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/network/local/cache_helper.dart';
import 'package:pay_fare/shared/styles/colors.dart';

class AdminHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit,AdminStates>(
      listener: (context, state){

      },
      builder: (context, state){
        var numberDrivers =AdminCubit.get(context).AllDriverInQueue.length;

        return Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [

                      Image.asset('assets/images/travel.png',width: 50,),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Active Driver',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  numberDrivers> 0? ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildChatItem(context,index),
                      separatorBuilder: (context, index) =>SizedBox(
                        height: 20,
                      ),
                      itemCount: numberDrivers):Center(
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
                  SizedBox(height: 20,),
                  Center(
                    child: state is !AdminLoadingDriversOnlineState ?defaultButton(
                      width: 150,
                        fontColor: Colors.white,
                        background: defaultColor,
                        function: ()
                        {
                         AdminCubit.get(context).RemoveFromQueue(adminId: CacheHelper.getData(key: 'adminId'));
                        // AdminCubit.get(context).PutDriverStatus(id: int.parse('${AdminCubit.get(context).DriversID[0]}'), value: 0);
                         AdminCubit.get(context).getAllQueueData();

                        },
                        text: 'Remove',
                    ):Center(child: CircularProgressIndicator()),
                  )
                ],
              ),
            ),
        );
      },
    );
  }
  Widget buildActiveDriver(context,index) => Padding(
    padding: const EdgeInsets.symmetric(horizontal:10.0),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('${AdminCubit.get(context).AllDriverInQueue[index]['driverName']}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,

                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  Spacer(),
                  Text('Car Id ',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,

                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),

          ]
      ),
      decoration: BoxDecoration(
       // color: defaultColor,
         border: Border.all(color: defaultColor,
             width: 2),
        borderRadius: BorderRadius.circular(20.0,),
      ),
    ),
  );

  Widget buildChatItem(context,index) => Padding(
    padding: const EdgeInsets.symmetric(horizontal:10.0),
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(AdminCubit.get(context).images[index]),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 3.0,
                bottom: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.green,

              ),
            ),

          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AdminCubit.get(context).AllDriverInQueue[index]['driverName']}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                'Car Id: ${AdminCubit.get(context).AllDriverInQueue[index]['carPlateNum']} ',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20,)


            ],
          ),
        )
      ],
    ),
  );

}
