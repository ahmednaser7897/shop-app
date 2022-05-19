// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_cupit.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_app/shared/shop%20models/Categories_models.dart';
import 'package:shop_app/shared/shop%20models/home_models.dart';

class ProudctScreen extends StatelessWidget {
  const ProudctScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCuipt, ShopState>(
        listener: (context, state) {
          if(state is ScChangeFavePage){
            if(state.state) {
              showToast(state.masseg,ToastState.SUCCESS);
            } else{
                showToast("error",ToastState.ERORR);
              }
            
          }
        },
        builder: (context, state) {
          ShopCuipt cupit = ShopCuipt.get(context);
          return ( cupit.homeData.data.products.isNotEmpty&&cupit.categorieData.data.data.isNotEmpty)? 
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  carouselSlider(cupit.homeData.data.banners),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          const Text(
                      "Categories",
                      style:  TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                     SizedBox(
                      height: 100,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context, indix){
                          if(cupit.categorieData.data.data[indix].image !="") {
                            return categorie(cupit.categorieData.data.data[indix]);
                          } else {
                            return Container();
                          }
                        },
                          separatorBuilder: (context, indix)=>const SizedBox(width: 5,),
                          itemCount: cupit.categorieData.data.data.length,
                          ),
                    ),
                  const Text(
                      "New Proudcts",
                      style:  TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                      ],
                    ),
                  ),
                  
                  Container(
                    color: Colors.grey[300],
                    child:gridView(cupit.homeData.data,cupit.fave,context,cupit)
                  ),
                ],
              ),
            ):const Center(child:  CircularProgressIndicator());
        }
    );
  }

  Widget carouselSlider(List<Banners> data){
    return CarouselSlider(
  items: data.map<Widget>((e) {
    if (e.image != '') {
      return Image(
        image: NetworkImage(
          e.image,
        ),
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }else{
      return Container();
    }
  }).toList(),
  options: CarouselOptions(
      height: 200,
      initialPage: 0,
      enableInfiniteScroll: true,
      autoPlay: true,
      //Reverse the order of items if set to true.Defaults to false.
      reverse: false,
      autoPlayInterval: const Duration(seconds: 2),
      autoPlayAnimationDuration: const Duration(seconds: 1),
      autoPlayCurve: Curves.fastOutSlowIn,
      scrollDirection: Axis.horizontal,
      viewportFraction: 1)
  );
  }
 
 Widget categorie(CategorieItemData data){
    if(data.image !="") {
      return  Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Image(
          image: NetworkImage( data.image,),
          width: 100,
          height: 100,
        ),
          Container(
            width: 100,
              color: Colors.black.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10),
                child: Text(
                  data.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14,color: Colors.white,),
                ),
              ))
      ],
    );
    }else{
      return Container();
    }
                      
  }

  Widget gridView(ProudctData data, Map<int,bool> fave,context,ShopCuipt cupit){
    return GridView.count(
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      childAspectRatio: 1 / 1.87,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(
        data.products.length
        , (index) {
        return Container(
          color:Colors.white,
          child: Column(
            children: [
              if ((data.products[index].image !=""))
                Stack(
                  alignment:AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      image: NetworkImage(data.products[index].image,),
                      width: double.infinity,
                      height: 200,
                    ),
                    if ((data.products[index].discount !=0))
                      Container(
                          color: Colors.red,
                          child: const Padding(
                            padding:EdgeInsets.symmetric(horizontal: 10),
                            child: Text("DISCOUNT",style: TextStyle(fontSize: 12),),
                          )
                      )
                  ],
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                        //mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(data.products[index].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, height: 1.3),),
                      
                    Row(
                      children: [
                        Text(
                          '${data.products[index].price.toString()} LE',
                           maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12,color: mainColor),
                        ),
                        if (data.products[index].discount ==0)
                        const Spacer(),
                        if (data.products[index].discount !=0)
                          Expanded(
                            child: Text(data.products[index].oldPrice.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ),
                        //const Spacer(),
                        IconButton(
                          
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              cupit.addDelfaver(data.products[index].id);
                              //cupit.fave[data.products[index].id]=!cupit.fave[data.products[index].id];
                              print(data.products[index].id);
                              //print(cupit.fave);
                            },
                            icon: CircleAvatar(
                              backgroundColor: Colors.grey,
                               child: Icon(Icons.favorite,
                               color:iconColor(fave[data.products[index].id]),
                               //fave[data.products[index].id]?mainColor: Colors.white ,
                               ),))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

Color iconColor(bool ?iconState){
    if(iconState==null){
      return Colors.white;
    }else if(iconState){
        return mainColor;
    }else {
      return Colors.white;
    }
  }
  }
