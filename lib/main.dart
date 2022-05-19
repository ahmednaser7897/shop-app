import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/homePage.dart';
import 'package:shop_app/screens/logein%20screens/on_boarding_screen.dart';
import 'package:shop_app/screens/logein%20screens/shop_login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/shop%20cupit/observer.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_cupit.dart';
import 'netWork/dio_helper.dart';
import 'shared/shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.inti();
  await CachHelper.inti();

  Widget widget;
  bool ?onBoarding;
  onBoarding = CachHelper.getData(key: 'boarding');
  token = CachHelper.getData(key: 'token');
  //print(" token is $token");
  if (onBoarding != null) {
    if (token != null) {
      widget = const MyHomePage();
    } else {
      widget = const ShopLogIn();
    }
  } else {
    widget = const OnBoardingScreen();
  }
  BlocOverrides.runZoned(
    () {runApp(MyApp(
    widget: widget,
  ));},
    blocObserver: MyBlocObserver()
  );
  
}

class MyApp extends StatelessWidget {
  final Widget widget;

  const MyApp({Key? key, required this.widget}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ShopCuipt()
              ..getHomeData()
              ..getFaver()
              ..getCategorieData()
              ..getProfile()
              ),
      ],
      child:
      MaterialApp(
        theme: lihghtTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: widget 
        /*BlocConsumer<ShopCuipt, ShopState>(
      listener: (context, state) {},
      builder: (context, state) { 
        return Scaffold();
        }
      ),*/
    ),);
  }
}
