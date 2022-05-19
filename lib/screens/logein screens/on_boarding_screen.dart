import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/shared_preferences/shared_preferences.dart';
import 'shop_login_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel(
      {required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  var bc = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/photos/1.jpg',
        title: 'Bakar Shop App',
        body: "In Bakar Shop App You can buy anything you want at the best prices and there are a lot of discounts, register now"),
    
  ];
 void submet(){
    CachHelper.setData(key: 'boarding', value: true).then((value) {
      if(value){
         navigatorAndEnd(context,const ShopLogIn());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: bc,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => boardItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: mainColor,
                  onPressed: () {
                     submet();
                      /*bc.nextPage(
                          duration: const Duration(microseconds: 1000),
                          curve: Curves.fastLinearToSlowEaseIn);*/
                    
                  },
                  child: const Icon(Icons.arrow_forward),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget boardItem(item) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage(item.image))),
          const SizedBox(
            height: 20,
          ),
          Text(
            item.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(item.body,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
        ],
      );
}
