// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/screens/logein%20screens/shop_login_screen.dart';
import 'package:shop_app/shared/shared_preferences/shared_preferences.dart';

import '../shop cupit/shop cupit/shop_cupit.dart';

const mainColor = Colors.lightBlue;
var lihghtTheme = ThemeData(
    primarySwatch: mainColor,
    fontFamily: "janna",
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black, size: 20),
     
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 20,
      titleTextStyle:  TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: mainColor,
      type: BottomNavigationBarType.fixed,
      elevation: 30,
      backgroundColor: Colors.white,
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: HexColor('333739')),
    textTheme: const TextTheme(
        bodyText1:  TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        bodyText2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
    iconTheme: const IconThemeData(color: Colors.black));

var darkTheme = ThemeData(
    
    primarySwatch: mainColor,
    fontFamily: "janna",
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: HexColor('333739'),
        elevation: 0,
        titleSpacing: 20,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(color: Colors.white, size: 20)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: mainColor,
       backgroundColor: HexColor('333739'),
       
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
     
      elevation: 30,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.white),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        bodyText2:  TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)));

Widget slider(context) {
  return Padding(
    padding: const EdgeInsetsDirectional.only(end: 20),
    child: Column(
      children: [
        const SizedBox(height: 5),
        Container(
          height: 0.5,
          color: mainColor,
        ),
        const SizedBox(height: 5)
      ],
    ),
  );
}

void navigatorTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigatorAndEnd(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
void showToast(String message, ToastState toast) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chosseToasteColor(toast),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { SUCCESS, ERORR, WARNING }
Color chosseToasteColor(ToastState toast) {
  Color color;
  switch (toast) {
    case ToastState.SUCCESS:
      color = Colors.blue;
      break;
    case ToastState.ERORR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

void logeOut(context) {
  ShopCuipt cupit = ShopCuipt.get(context);
  CachHelper.removeData(key: "token").then((value) {
    if (value){ 
      navigatorAndEnd(context,const ShopLogIn());
      cupit.changeButtomBarIndex(0);
    }
  });
}
String ?token='';

