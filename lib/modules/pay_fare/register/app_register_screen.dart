import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/client_pay_fare/app_layout.dart';
import 'package:pay_fare/modules/pay_fare/otp/otp_screen.dart';
import 'package:pay_fare/modules/pay_fare/register/cubit/cubit.dart';
import 'package:pay_fare/modules/pay_fare/register/cubit/states.dart';
import 'package:pay_fare/shared/components/components.dart';

class AppRegisterScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  // var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(),
    // );

    return BlocProvider(
      create: (BuildContext context) => AppRegisterCubit(),
      child: BlocConsumer<AppRegisterCubit, AppRegisterStates>(
        listener: (context, state) {
          if (state is AppRegisterSuccessState) {
            //navigateAndFinish(context, AppLayout());
          }
          if (state is AppRegisterSuccessState) {
            if (state.registerModel.user!.type!.id == 3) {
              print(state.registerModel.user!.name);
              print(state.registerModel.user!.phone);
              // CacheHelper.saveData(key: 'token', value: state.loginModel.id).then((value) {
              //navigateTo(context, OtpScreen(phoneNumber: phoneController.text));
              //navigateAndFinish(context, AppLayout());
              // });
            } else {
              print(state.registerModel.user!.id);
              showToast(text: "error", state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Image.asset('assets/images/register.png'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'REGISTER',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          // Text(
                          //   'Register now to communicate with friends',
                          //   style: Theme.of(context).textTheme.headline6!.copyWith(
                          //       color: Colors.grey
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 30.0,
                          // ),
                          defaultFormFiled(
                            controller: nameController,
                            type: TextInputType.emailAddress,
                            validation: (String value) {
                              if (value.isEmpty) {
                                return ' Enter your Name';
                              }
                            },
                            lable: 'Name',
                            fixIcon: Icons.person,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          // defaultFormFiled(
                          //   controller: emailController,
                          //   type: TextInputType.emailAddress,
                          //   validation: (String value)
                          //   {
                          //     if(value.isEmpty)
                          //     {
                          //       return ' Enter your Email Address';
                          //     }
                          //   },
                          //   lable:'Email Address',
                          //   fixIcon: Icons.email,
                          // ),
                          defaultFormFiled(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validation: (String value) {
                              if (value.isEmpty) {
                                return ' Enter your Phone';
                              }
                            },
                            lable: 'Phone number',
                            fixIcon: Icons.phone,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          defaultFormFiled(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              validation: (String value) {
                                if (value.isEmpty) {
                                  return 'Password is too short';
                                }
                              },
                              lable: 'Password',
                              fixIcon: Icons.lock,
                              suffix: AppRegisterCubit.get(context).suffix,
                              ispassword:
                                  AppRegisterCubit.get(context).isPassword,
                              sufixpressd: () {
                                AppRegisterCubit.get(context)
                                    .ChangePasswordVisibility();
                              },
                              onsumit: (value) {}),
                          SizedBox(
                            height: 30.0,
                          ),

                          // SizedBox(
                          //   height: 30.0,
                          // ),
                          state is! AppRegisterLoadingState
                              ? defaultButton(
                                  function: () async {
                                     // await  AppRegisterCubit.get(context).submitPhoneNumber(phoneController.text);
                                     // navigateTo(context, OtpScreen(phoneNumber: phoneController.text));

                                    if (formkey.currentState!.validate()) {
                                      await  AppRegisterCubit.get(context).submitPhoneNumber(phoneController.text);
                                      navigateTo(context, OtpScreen(phoneNumber: phoneController.text));

                                      await  AppRegisterCubit.get(context).submitPhoneNumber(phoneController.text);
                                      navigateTo(context, OtpScreen(phoneNumber: phoneController.text));

                                    //   AppRegisterCubit.get(context).userRegister(
                                    //     name: nameController.text,
                                    //     username: phoneController.text,
                                    //     password: passwordController.text,
                                    //     phone: phoneController.text,
                                    //   );
                                    //   print('name ${nameController.text}');
                                    //   print('username ${passwordController.text}');
                                    //   print('pass ${passwordController.text}');
                                    //   print('phone ${phoneController.text}');
                                     }
                                    //navigateAndFinish(context, AppLayout());
                                  },
                                  text: 'REGISTER',
                                  isUberCase: true)
                              : Center(child: CircularProgressIndicator()),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
