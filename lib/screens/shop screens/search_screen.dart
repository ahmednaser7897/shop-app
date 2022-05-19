// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_cupit.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_state.dart';
import 'package:shop_app/shared/shop%20models/search_models.dart';

class   SearchScreen extends StatelessWidget{
  
  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isSearch=false;
    return BlocConsumer<ShopCuipt, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          var searchC=TextEditingController();
          var keyf = GlobalKey<FormState>();
          ShopCuipt cupit = ShopCuipt.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Form(
                  key: keyf,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField( 
                      onFieldSubmitted: (value){
                        cupit.search(value);
                      },              
                      controller: searchC, keyboardType: TextInputType.text,
                      validator: (value){
                      if(value!.isEmpty) {
                        return "Fild must not be embty";
                      } else {
                        return null;
                      }},
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder() ,
                        labelText: "Search",//:"بحث",
                        labelStyle:  TextStyle(color:mainColor,fontWeight: FontWeight.bold,fontSize: 15) ,
                        prefixIcon:Icon(Icons.search,color:mainColor,size: 20,) ,
                        prefixStyle:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),
                      ),
                    ), 
                  ),
                ),
                const SizedBox(height: 10,),
                if(state is LodinSearchePage)
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: LinearProgressIndicator(),
                ),
                if(state is ScSearchePage&& state.searchedData.data1.data2.isNotEmpty)
                Expanded(
                  child:
                  ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index)=>
                  searshedItem(cupit.searchedData.data1.data2[index],cupit,isSearch),
                  separatorBuilder: (context,index)=>slider(context),
                  itemCount:cupit.searchedData.data1.data2.length,
                  ),
                ),
                if(state is ScSearchePage&&state.searchedData.data1.data2.isEmpty)
               const Expanded(child: Center(child: Icon(Icons.search_off,size: 150,),))
              ],
            ),
          );
        }
        );
  }
  Widget searshedItem(Product data,ShopCuipt cupit,isSearch){
  return 
    Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
    height: 150,
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if ((data.image !=""))
        Stack( 
          alignment:AlignmentDirectional.bottomStart,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image(
                image: NetworkImage(data.image,),
                //fit: BoxFit.cover,
              ),
            ),
            if ((data.discount !=0&& isSearch))
            Container(
              color: Colors.red,
              child: const Padding(
                padding:EdgeInsets.symmetric(horizontal: 10),
                child: Text("DISCOUNT",style:TextStyle(fontSize: 12),),
              )
            )
          ],
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            children: [
            Text(data.name,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 17, height: 1.3),),
              const Spacer(),
              Row(
                children: [
                  Text(
                    data.price.toString(),
                      maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16,color: mainColor),
                  ),
                  const SizedBox(width: 5,),
                  if (data.discount !=0&&isSearch)
                    Text(data.oldPrice.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  const Spacer(),
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      cupit.addDelfaver(data.id);
                      print(data.id);
                    },
                    icon: CircleAvatar(
                      backgroundColor: Colors.grey,
                        child: Icon(Icons.favorite,
                        color:iconColor(cupit.fave[data.id])),))
                ],
              )
            ],
          ),
        ),
                ],
              ),
            ),
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