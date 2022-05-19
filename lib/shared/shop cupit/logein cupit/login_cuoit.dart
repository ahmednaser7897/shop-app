

// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/netWork/dio_helper.dart';
import 'package:shop_app/netWork/end_points.dart';
import 'package:shop_app/shared/shop%20models/logein_models.dart';

import 'logein_states.dart';

class LoginCupit extends Cubit<LoginState>{

  LoginCupit() : super(IntiLoginState());
  
   
   static LoginCupit get(context)=>BlocProvider.of(context);
     var showPass=false;
     void changeShowPass(){
       showPass=!showPass;
       emit(ChangeShowPass());
     }
     var showPassr=false;
     void changeShowPassRegiste(){
       showPassr=!showPassr;
       emit(ChangeShowPassRegiste());
     }

  late ShopLoginModel loginModel;
  void userLogin({required String email,required String pass})async{
    emit(LodingLoginState());
  await DioHelper.postData(
    url: LOGIN,
    data:{
      'email':email,
      'password':pass,
    }).then((value) {
      loginModel=ShopLoginModel.fromJason(value.data);
      print(loginModel.status);
      emit(ScLoginState(loginModel));
    }).catchError((onError){
      print('error from user login function ${onError.toString()}');
      emit(ErrorLoginState(onError.toString()));
    });
  }
  late ShopLoginModel loginModelRegiste;
  void registerLogin({required String email,required String pass,required String name,required String phone})async{
    emit(LodingRegisteState());
  await DioHelper.postData(
    url: REGISTER,
    data:{
      'email':email,
      'password':pass,
      'name':name,
      'phone':phone,
    }).then((value) {
      loginModelRegiste=ShopLoginModel.fromJason(value.data);
      print(loginModelRegiste.status);
      emit(ScRegisteState(loginModelRegiste));
    }).catchError((onError){
      print('error from user REGISTER function ${onError.toString()}');
      emit(ErrorRegisteState(onError.toString()));
    });
  }
}