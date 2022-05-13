
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/models/client_model/client_login_model.dart';
import 'package:pay_fare/modules/pay_fare/login/cubit/states.dart';
import 'package:pay_fare/shared/network/end_points.dart';
import 'package:pay_fare/shared/network/remote/dio_helper.dart';


class AppLoginCubit extends Cubit<AppLoginStates>
{
  AppLoginCubit() : super(AppLoginInitialState());
  static AppLoginCubit get(context)=> BlocProvider.of(context);

  ClientLoginModel? loginModel;

  void userLogin({
  required String phone,
  required String password,
})
  {
    emit(AppLoginLoadingState());
    DioHelper.postData(url: LOGIN,
        data:{
          'phone':phone,
          'password':password,
        }
    ).then((value) {
      print(value.data);
      loginModel = ClientLoginModel.fromJson(value.data);
      print('data is : ${loginModel!.user!.type!.name}');
      emit(AppLoginSuccessState(loginModel!));
    }
    ).catchError((error){
      emit(AppLoginErrorState(error.toString()));
      print('errorrrrrrrrrrrrrrrrrrr');
    });

    // FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: phone,
    //     password: password
    // ).then((value) {
    //   print(value.user!.email);
    //   print(value.user!.uid);
    //   emit(AppLoginSuccessState());
    // }).catchError((error){
    //
    //   emit(AppLoginErrorState(error.toString()));
    //   print('error is = ${error.toString()}');
    // });
  }
  IconData suffix= Icons.visibility;
  bool isPassword=true;

  void ChangePasswordVisibility()
  {
    isPassword= !isPassword;
    suffix= isPassword? Icons.visibility_off_outlined :Icons.visibility;
    emit(AppChangePasswordVisibilityState());
  }

}