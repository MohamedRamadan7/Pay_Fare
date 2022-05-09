
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_fare/models/app.dart';
import 'package:pay_fare/modules/pay_fare/register/cubit/states.dart';


class AppRegisterCubit extends Cubit<AppRegisterStates>
{
  AppRegisterCubit() : super(AppRegisterInitialState());
  static AppRegisterCubit get(context)=> BlocProvider.of(context);

//   void userRegister({
//   required String email,
//   required String password,
//     required String name,
//     required String phone,
// })
//   {
//     emit(AppRegisterLoadingState());
//
//     FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password
//     ).then((value) {
//       print(value.user!.email);
//       print(value.user!.uid);
//       userCreate(
//           uId:value.user!.uid,
//           name: name,
//           email:email ,
//           phone: phone,
//       );
//     }).catchError((error){
//       emit(AppRegisterErrorState(error.toString()));
//
//     });
//   }
//   void userCreate({
//     required String email,
//     required String name,
//     required String phone,
//     required String uId,
//   })
//   {
//     AppUserModel model =AppUserModel(
//       name:name,
//       email:email ,
//       phone:phone ,
//       uId: uId,
//     );
//
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(uId)
//         .set(model.toMap())
//         .then((value) {
//           print ('user is : ${uId}');
//           emit(AppCreateUserSuccessState());
//
//     }).catchError((error) {
//       print ('error is : ${error.toString()}');
//       emit(AppCreateUserErrorState(error.toString()));
//     });
//   }

  String verificationId= '';
  PhoneAuthCredential? credential ;
// test

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(Loading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 40),
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
    this.verificationId = await verificationId;
    print(this.verificationId);

    emit(PhoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId,
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