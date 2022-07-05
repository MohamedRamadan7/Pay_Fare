
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/models/app.dart';
import 'package:pay_fare/models/client_model/register_model.dart';
import 'package:pay_fare/modules/pay_fare/register/cubit/states.dart';
import 'package:pay_fare/shared/network/end_points.dart';
import 'package:pay_fare/shared/network/local/cache_helper.dart';
import 'package:pay_fare/shared/network/remote/dio_helper.dart';


class AppRegisterCubit extends Cubit<AppRegisterStates>
{
  AppRegisterCubit() : super(AppRegisterInitialState());
  static AppRegisterCubit get(context)=> BlocProvider.of(context);



  ClientRegisterModel? registerModel;
  void userRegister({
    required String name,
    required String username,
    required String phone,
    required String password,
  })
  {
    emit(AppRegisterLoadingState());

    DioHelper.postData(url: REGISTER,
        data:{
            'user':{
              'name':name,
              'userName':username,
              'phone':phone,
              'password':password,
            }
        }
    ).then((value){
      print(value.data);
      registerModel = ClientRegisterModel.fromJson(value.data);

      emit(AppRegisterSuccessState(registerModel!));
    }).catchError((error){

      emit(AppRegisterErrorState(error.toString()));
      print('error is = ${error.toString()}');
    });
  }

  String verificationId= '';
  PhoneAuthCredential? credential ;

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(Loading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 120),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    print(credential.smsCode);
    print(credential.verificationId);
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print(verificationId);

    print('verificationFailed : ${error.toString()}');
    emit(ErrorOccurred(errorMsg: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) async{
    print('codeSent');
    CacheHelper.saveData(key: 'verificationId', value: verificationId);
    this.verificationId = await verificationId;
    print(this.verificationId);

    emit(PhoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    credential = PhoneAuthProvider.credential(
        verificationId: '${CacheHelper.getData(key: 'verificationId')}',
        smsCode: otpCode);
    print("sms code is : ${credential!.smsCode}");
    print('verificationId is :${credential!.verificationId}');

    await signIn(credential!);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('PhoneOTPVerified');
      emit(PhoneOTPVerified());
    } catch (error) {
      emit(ErrorOccurred(errorMsg: error.toString()));
      print('ErrorOccurred${error.toString()}');
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }


  IconData suffix= Icons.visibility;
  bool isPassword=true;

  void ChangePasswordVisibility()
  {
    isPassword= !isPassword;
    suffix= isPassword? Icons.visibility_off_outlined :Icons.visibility;
    emit(AppChangeRegisterPasswordVisibilityState());
  }

}