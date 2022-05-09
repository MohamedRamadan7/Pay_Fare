import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/layout/admin_pay_fare/admin_layout.dart';
import 'package:pay_fare/layout/client_pay_fare/app_layout.dart';
import 'package:pay_fare/layout/driver_pay_fare/driver_layout.dart';
import 'package:pay_fare/modules/pay_fare/login/cubit/cubit.dart';
import 'package:pay_fare/modules/pay_fare/login/cubit/states.dart';
import 'package:pay_fare/modules/pay_fare/register/app_register_screen.dart';
import 'package:pay_fare/shared/components/components.dart';



class AppLoginScreen extends StatelessWidget {
  var formkey =GlobalKey<FormState>();

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> AppLoginCubit (),

      child: BlocConsumer<AppLoginCubit,AppLoginStates>(
        listener: (context ,state){

        },
        builder: (context ,state){
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 235,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blue
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Image.asset('assets/images/login.png'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                                color: Colors.black
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),

                          defaultFormFiled(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validation: (String value)
                            {
                              if(value.isEmpty)
                              {
                                return ' Enter your Phone';
                              }
                            },
                            lable:'Phone number',
                            fixIcon: Icons.phone,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          defaultFormFiled(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              validation: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return 'Password is too short';
                                }
                              },
                              lable:'Password',
                              fixIcon: Icons.lock,
                              suffix: AppLoginCubit.get(context).suffix,
                              ispassword: AppLoginCubit.get(context).isPassword,
                              sufixpressd: ()
                              {
                                AppLoginCubit.get(context).ChangePasswordVisibility();
                              },
                              onsumit: (value)
                              {
                                if(formkey.currentState!.validate())
                                {
                                  // AppLoginCubit.get(context).userLogin(
                                  //     email: emailController.text,
                                  //     password: passwordController.text);
                                  // print('email ${emailController.text}');
                                  // print('pass ${passwordController.text}');
                                }
                              }
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          state is! AppLoginLoadingState ? defaultButton(
                              function: ()
                              {
                                if(formkey.currentState!.validate())
                                {

                                  AppLoginCubit.get(context).userLogin(
                                      phone: phoneController.text,
                                      password: passwordController.text);
                                  print('phone ${phoneController.text}');
                                  print('pass ${passwordController.text}');

                                }
                                navigateAndFinish(context,AppLayout());

                              },
                              text: 'login',
                              isUberCase: true
                          ): Center(child: CircularProgressIndicator()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Don \'t have account?'
                              ),
                              TextButton(
                                onPressed: ()
                                {
                                  navigateTo(context,AppRegisterScreen());
                                },
                                child: Text(
                                    'REGISTER'
                                ),),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
