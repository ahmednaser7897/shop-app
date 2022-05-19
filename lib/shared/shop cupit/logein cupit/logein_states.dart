


import 'package:shop_app/shared/shop%20models/logein_models.dart';

abstract class LoginState{}
 class IntiLoginState extends LoginState{}
 class LodingLoginState extends LoginState{}
 class ScLoginState extends LoginState{
   final ShopLoginModel loginModel;

  ScLoginState(this.loginModel);
 }
 class ErrorLoginState extends LoginState{
  final String error;
  ErrorLoginState(this.error);
 }
 class ChangeShowPass extends LoginState{}
 
 class LodingRegisteState extends LoginState{}
 class ScRegisteState extends LoginState{
   final ShopLoginModel loginModel;

  ScRegisteState(this.loginModel);
 }
 class ErrorRegisteState extends LoginState{
  final String error;
  ErrorRegisteState(this.error);
 }
 class ChangeShowPassRegiste extends LoginState{}
 