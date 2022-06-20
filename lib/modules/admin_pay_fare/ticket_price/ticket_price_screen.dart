import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/cubit.dart';
import 'package:pay_fare/layout/admin_pay_fare/cubit/states.dart';
import 'package:pay_fare/shared/components/components.dart';

class AdminTicketPriceScreen extends StatelessWidget {

  var fromController = TextEditingController();
  var toController = TextEditingController();
  var costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit,AdminStates>(
    listener: (context, state){},
    builder: (context, state){
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'From',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'To',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Cost',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(width: 0,),
                          ),

                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => buildPrice(),
                            separatorBuilder: (context, index) =>SizedBox(
                              height: 20,
                            ),
                            itemCount: 10),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //   child: Row(
                    //
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           height: 45,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(6),
                    //               border: Border.all(color: Colors.grey,width: 1)
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal:10.0),
                    //             child: Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Text('Mansoura',
                    //                       style: TextStyle(
                    //                         fontSize: 16,
                    //
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('Cairo',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('50',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       OutlinedButton(
                    //         onPressed: (){},
                    //         child: Container(
                    //           height: 40,
                    //           child: Icon(
                    //             Icons.edit_outlined,
                    //             size: 20.0,),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //
                    //
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //   child: Row(
                    //
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           height: 45,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(6),
                    //               border: Border.all(color: Colors.grey,width: 1)
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal:10.0),
                    //             child: Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Text('Mansoura',
                    //                       style: TextStyle(
                    //                         fontSize: 16,
                    //
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('Cairo',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('50',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       OutlinedButton(
                    //         onPressed: (){},
                    //         child: Container(
                    //           height: 40,
                    //           child: Icon(
                    //             Icons.edit_outlined,
                    //             size: 20.0,),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //   child: Row(
                    //
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           height: 45,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(6),
                    //               border: Border.all(color: Colors.grey,width: 1)
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal:10.0),
                    //             child: Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Text('Mansoura',
                    //                       style: TextStyle(
                    //                         fontSize: 16,
                    //
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('Cairo',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('50',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       OutlinedButton(
                    //         onPressed: (){},
                    //         child: Container(
                    //           height: 40,
                    //           child: Icon(
                    //             Icons.edit_outlined,
                    //             size: 20.0,),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //
                    //
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //   child: Row(
                    //
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           height: 45,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(6),
                    //               border: Border.all(color: Colors.grey,width: 1)
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal:10.0),
                    //             child: Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Text('Mansoura',
                    //                       style: TextStyle(
                    //                         fontSize: 16,
                    //
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('Cairo',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('50',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       OutlinedButton(
                    //         onPressed: (){},
                    //         child: Container(
                    //           height: 40,
                    //           child: Icon(
                    //             Icons.edit_outlined,
                    //             size: 20.0,),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //
                    //
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //   child: Row(
                    //
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           height: 45,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(6),
                    //               border: Border.all(color: Colors.grey,width: 1)
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal:10.0),
                    //             child: Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Text('Mansoura',
                    //                       style: TextStyle(
                    //                         fontSize: 16,
                    //
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('Cairo',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('50',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       OutlinedButton(
                    //         onPressed: (){},
                    //         child: Container(
                    //           height: 40,
                    //           child: Icon(
                    //             Icons.edit_outlined,
                    //             size: 20.0,),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //
                    //
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //   child: Row(
                    //
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           height: 45,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(6),
                    //               border: Border.all(color: Colors.grey,width: 1)
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal:10.0),
                    //             child: Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Text('Mansoura',
                    //                       style: TextStyle(
                    //                         fontSize: 16,
                    //
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('Cairo',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //
                    //                     child: Center(
                    //                       child: Text('50',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       OutlinedButton(
                    //         onPressed: (){},
                    //         child: Container(
                    //           height: 40,
                    //           child: Icon(
                    //             Icons.edit_outlined,
                    //             size: 20.0,),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //
                    //
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Center(
                    //   child: OutlinedButton(
                    //     onPressed: (){},
                    //     child: Container(
                    //         height: 40,
                    //         width: 60,
                    //         child:Row(
                    //           children: [
                    //             Container(child: Text('Edit')),
                    //             SizedBox(
                    //               width: 10,
                    //             ),
                    //             Icon(
                    //               Icons.edit_outlined,
                    //               size: 20.0,),
                    //           ],
                    //         )
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
    }
    );
  }
  Widget buildPrice() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(

      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey,width: 1)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(

                      child: Text('Mansoura',
                        style: TextStyle(
                          fontSize: 16,

                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(

                      child: Center(
                        child: Text('Cairo',
                          style: TextStyle(
                            fontSize: 16,

                          ),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(

                      child: Center(
                        child: Text('50',
                          style: TextStyle(
                            fontSize: 16,

                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        OutlinedButton(
          onPressed: (){},
          child: Container(
            height: 40,
            child: Icon(
              Icons.edit_outlined,
              size: 20.0,),
          ),
        ),
      ],
    ),


  );
//void ShowBottomSheet() =>ShowModelBottomSheet();
}
