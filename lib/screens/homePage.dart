// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/shop%20screens/search_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_cupit.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCuipt, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCuipt cupit=ShopCuipt.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Shoop App"),
             actions: [
                IconButton(
                    onPressed: () {
                      navigatorTo(context,const SearchScreen());
                      //cupit.getProfile();
                    },
                    icon: const Icon(Icons.search)),
              ],
          ),
          body://CategorieScreen(),
          cupit.screens[cupit.bouttomBarIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value){
              cupit.changeButtomBarIndex(value);
            },
            currentIndex: cupit.bouttomBarIndex,
            elevation: 30,

            backgroundColor: Colors.white,
            items:const [
               BottomNavigationBarItem(icon:Icon( Icons.home),label: "Home"),
               BottomNavigationBarItem(icon:Icon( Icons.apps),label: "Categories"),
               BottomNavigationBarItem(icon:Icon( Icons.favorite),label: "Favorites"),
               BottomNavigationBarItem(icon: Icon( Icons.settings),label: "Settings"),
            ],
          ),
        );
      },
    );
  }
}
