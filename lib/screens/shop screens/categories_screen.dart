

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_cupit.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_state.dart';
import 'package:shop_app/shared/shop%20models/Categories_models.dart';

class   CategorieScreen extends StatelessWidget{
  const CategorieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCuipt, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCuipt cupit=ShopCuipt.get(context);
        return (cupit.categorieData.data.data.isNotEmpty)? ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index)=>item(cupit.categorieData.data.data[index]),
           separatorBuilder: (context,index)=>slider(context),
            itemCount:cupit.categorieData.data.data.length
            ):const Center(child: CircularProgressIndicator(),);
        
        }
    );
  }
  Widget item(CategorieItemData data){
    if(data.image !="") {
      return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        SizedBox(
          height: 120,width: 120,
          child: ClipRRect(borderRadius: BorderRadius.circular(5), child: Image(
          image: NetworkImage(data.image,),fit: BoxFit.cover,
          loadingBuilder: (context, child, ImageChunkEvent ?loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child:  CircularProgressIndicator());
            },
          )),
        ),
        const SizedBox(width: 10,),
        Text(data.name,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios),
       ],
      ),
    );
    }else{
      return Container();
    }
  }

}