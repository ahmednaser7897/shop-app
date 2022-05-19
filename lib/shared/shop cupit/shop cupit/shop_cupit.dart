// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/netWork/dio_helper.dart';
import 'package:shop_app/netWork/end_points.dart';
import 'package:shop_app/screens/shop%20screens/categories_screen.dart';
import 'package:shop_app/screens/shop%20screens/favorite_screen.dart';
import 'package:shop_app/screens/shop%20screens/proudcts_screen.dart';
import 'package:shop_app/screens/shop%20screens/settings_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_state.dart';
import 'package:shop_app/shared/shop%20models/Categories_models.dart';
import 'package:shop_app/shared/shop%20models/Faver_models.dart';
import 'package:shop_app/shared/shop%20models/home_models.dart';
import 'package:shop_app/shared/shop%20models/logein_models.dart';
import 'package:shop_app/shared/shop%20models/search_models.dart';

class ShopCuipt extends Cubit<ShopState>{
  ShopCuipt() : super(IntiShopState());
  static ShopCuipt get(context)=>BlocProvider.of(context);
  int bouttomBarIndex=0;
  List<Widget> screens=[const ProudctScreen(),const CategorieScreen(),const FavoriteScreen(),SettingsScreen()];
  void changeButtomBarIndex(int value){
    
    bouttomBarIndex=value;
    if(bouttomBarIndex==1) {
      getCategorieData();
    }
    if(bouttomBarIndex==2) {
      getFaver();
    }
    if(bouttomBarIndex==3) {
      getProfile();
    }
    emit(ChangeButtomBarIndex());
  }
 
   
  late  HomeData homeData=HomeData();
  void getHomeData(){
    emit(LodinHomePage());
    DioHelper.getData(url: HOME,).then((value) {
      print(value.data);
      homeData=HomeData.fromJason(value.data);
      //print(homeData.data.banners[1].id);
      emit(ScHomePage());
    }).catchError((onError){
      print("error from getHomeData is $onError");
      emit(ErorrHomePage(onError.toString()));

    });

  }
  late Categories categorieData=Categories();
  void getCategorieData(){
    emit(LodinCategoriePage());
    DioHelper.getData(url: CATEGORIES,).then((value) {
      categorieData=Categories.fromJason(value.data);
      print(categorieData.data.data[1].id);
      emit(ScCategoriePage());
    }).catchError((onError){
      print("error from getHomeData is $onError");
      emit(ErorrCategoriePage(onError.toString()));
    });

  }
  
  late  FaveState faveState;
  void addDelfaver(int id){
    if( fave[id]==null) {
      fave[id]=false;
    } else {
      fave[id]=!fave[id]!;
    }
    emit(LodinChangeFavePage());
    DioHelper.postData(url: FAVE, data: {"product_id": id},token: token,)
    .then((value) {
      faveState=FaveState.fromJason(value.data);
      if(!faveState.status) {
        fave[id]=!fave[id]!;
      } else {
        getFaver();
      }
      print(faveState.message);
      emit(ScChangeFavePage(faveState.message,faveState.status));
    }).catchError((onError){
      if(!faveState.status) fave[id]=!fave[id]!;
      emit(ErorrCategoriePage(onError.toString()));
    });

  }

  Map<int,bool> fave={};
  FaverData ?faveData;
  void getFaver(){
    emit(LodinFavePage());
    DioHelper.getData(url: FAVE,token: token).then((value) {
      faveData=FaverData.fromJson(value.data);
      faveData!.data1!.data2.forEach((element){
        fave[element.product!.id]=true;
      });
      //print(faveData.data1.data2[0].product.id);
      emit(ScFavePage());
    }).catchError((onError){
      print(onError.toString());
      emit(ErorrFavePage(onError.toString()));
    });
  }

  ShopLoginModel ?loginModel;
  void getProfile(){
    emit(LodinProfilePage());
   DioHelper.getData(url: PROFILE,token: token).then((value) {
      loginModel=ShopLoginModel.fromJason(value.data);
      print(loginModel!.status);
      emit(ScprofilePage(loginModel!));
    }).catchError((onError){
      print('error from user login function ${onError.toString()}');
      emit(ErorrprofilePage(onError.toString()));
    });
  }


  void updateProfile({
     required String name,required String number,required String email, String ?pass
  }){
    emit(LodinUpdateProfilePage());
   DioHelper.putData(url: UPDATE,token: token,
    data: {
      "name": name,
	    "phone": number,
	    "email": email,
    }
   ).then((value) {
      loginModel=ShopLoginModel.fromJason(value.data);
      print(loginModel!.status);
      emit(ScUpdateProfilePage(loginModel!));
    }).catchError((onError){
      print('error from user login function ${onError.toString()}');
      emit(ErorrUpdateProfilePage(onError.toString()));
    });
  }

  SearchData searchedData=SearchData();
  void search(String text){
    emit(LodinSearchePage());
    DioHelper.postData(url: SEARCH, data: {
      "text": text
    },token: token).then((value) {
      searchedData=SearchData.fromJson(value.data);
      //print(searchedData.data1.data2[0].price);
      emit(ScSearchePage(searchedData));
      //emit(OutSearchePage());
    }).catchError((onError){
      emit(ErorrSearchePage(onError.toString()));
      print(onError.toString());
    });
  }
   void outSearch()=>emit(OutSearchePage());
}


