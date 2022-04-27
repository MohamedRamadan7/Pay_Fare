import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/client_pay_fare/app_layout.dart';
import 'package:pay_fare/modules/pay_fare/register/cubit/cubit.dart';
import 'package:pay_fare/modules/pay_fare/register/cubit/states.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/styles/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final phoneNumber;

  OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

   String otpCode ='';

  // Widget _buildIntroTexts() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Verify your phone number',
  //         style: TextStyle(
  //             color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(
  //         height: 30,
  //       ),
  //       Container(
  //         margin: EdgeInsets.symmetric(horizontal: 2),
  //         child: RichText(
  //           text: TextSpan(
  //             text: 'Enter your 6 digit code numbers sent to ',
  //             style: TextStyle(color: Colors.black, fontSize: 18, height: 1.4),
  //             children: <TextSpan>[
  //               TextSpan(
  //                 text: '$phoneNumber',
  //                 style: TextStyle(color: MyColors.blue),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  void showProgressIndicator(BuildContext context) {
    // AlertDialog alertDialog = AlertDialog(
    //   backgroundColor: Colors.transparent,
    //   elevation: 0,
    //   content: Center(
    //     child: CircularProgressIndicator(
    //       valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    //     ),
    //   ),
    // );
    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        );
      },
    );
  }

  // Widget _buildPinCodeFields(BuildContext context) {
  //   return Container(
  //     child: PinCodeTextField(
  //       appContext: context,
  //       autoFocus: true,
  //       cursorColor: Colors.black,
  //       keyboardType: TextInputType.number,
  //       length: 6,
  //       obscureText: false,
  //       animationType: AnimationType.scale,
  //       pinTheme: PinTheme(
  //         shape: PinCodeFieldShape.box,
  //         borderRadius: BorderRadius.circular(5),
  //         fieldHeight: 50,
  //         fieldWidth: 40,
  //         borderWidth: 1,
  //         activeColor: MyColors.blue,
  //         inactiveColor: MyColors.blue,
  //         inactiveFillColor: Colors.white,
  //         activeFillColor: MyColors.lightBlue,
  //         selectedColor: MyColors.blue,
  //         selectedFillColor: Colors.white,
  //       ),
  //       animationDuration: Duration(milliseconds: 300),
  //       backgroundColor: Colors.white,
  //       enableActiveFill: true,
  //       onCompleted: (submitedCode) {
  //         otpCode = submitedCode;
  //         print("Completed");
  //       },
  //       onChanged: (value) {
  //         print(value);
  //       },
  //     ),
  //   );
  // }

  void _login(BuildContext context) async {
    await AppRegisterCubit.get(context).submitOTP(otpCode);
  }

  // Widget _buildVrifyButton(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: ElevatedButton(
  //       onPressed: () {
  //         showProgressIndicator(context);
  //
  //         _login(context);
  //       },
  //       child: Text(
  //         'Verify',
  //         style: TextStyle(color: Colors.white, fontSize: 16),
  //       ),
  //       style: ElevatedButton.styleFrom(
  //         minimumSize: Size(110, 50),
  //         primary:defaultColor,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(6),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildPhoneVerificationBloc() {
  //   return BlocListener<AppRegisterCubit, AppRegisterStates>(
  //     listenWhen: (previous, current) {
  //       return previous != current;
  //     },
  //     listener: (context, state) {
  //       if (state is Loading) {
  //         showProgressIndicator(context);
  //       }
  //
  //       if (state is PhoneOTPVerified) {
  //         Navigator.pop(context);
  //         //Navigator.of(context).pushReplacementNamed(mapScreen);
  //         navigateAndFinish(context, AppLayout());
  //       }
  //
  //       if (state is ErrorOccurred) {
  //         Navigator.pop(context);
  //         String errorMsg = (state).errorMsg;
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(errorMsg),
  //             backgroundColor: Colors.red,
  //             duration: Duration(seconds: 5),
  //           ),
  //         );
  //       }
  //     },
  //     child: Container(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppRegisterCubit(),
      child: BlocConsumer<AppRegisterCubit, AppRegisterStates>(
        listener:(context ,state)
        {
          if (state is Loading) {
            showProgressIndicator(context);
            print('Loading app');
          }

          if (state is PhoneOTPVerified) {
            Navigator.pop(context);
            print('done app');
            //Navigator.of(context).pushReplacementNamed('${AppLayout()}');
            navigateAndFinish(context, AppLayout());
          }

          if (state is ErrorOccurred) {
            Navigator.pop(context);
            print('ErrorOccurred app');
            String errorMsg = (state).errorMsg;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMsg),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 5),
              ),
            );
          }
        },
        builder: (context ,state)
        {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Verify your phone number',
                            style: TextStyle(
                                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            child: RichText(
                              text: TextSpan(
                                text: 'Enter your 6 digit code numbers sent to ',
                                style: TextStyle(color: Colors.black, fontSize: 18, height: 1.4),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '$phoneNumber',
                                    style: TextStyle(color: MyColors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 88,
                      ),
                      Container(
                        child: PinCodeTextField(
                          appContext: context,
                          autoFocus: true,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          length: 6,
                          obscureText: false,
                          animationType: AnimationType.scale,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            borderWidth: 1,
                            activeColor: MyColors.blue,
                            inactiveColor: MyColors.blue,
                            inactiveFillColor: Colors.white,
                            activeFillColor: MyColors.lightBlue,
                            selectedColor: MyColors.blue,
                            selectedFillColor: Colors.white,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.white,
                          enableActiveFill: true,
                          onCompleted: (submitedCode) {
                            otpCode = submitedCode;
                            print("Completed");
                          },
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            showProgressIndicator(context);

                            _login(context);
                          },
                          child: Text(
                            'Verify',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(110, 50),
                            primary: defaultColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),
                      // _buildPhoneVerificationBloc(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
