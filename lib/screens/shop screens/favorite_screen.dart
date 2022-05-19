
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_cupit.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_state.dart';
import 'package:shop_app/shared/shop%20models/Faver_models.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCuipt, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          ShopCuipt cupit = ShopCuipt.get(context);
          if(cupit.faveData!=null){
            if(cupit.faveData!.data1!=null){
              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => faveItem(
                      cupit.faveData!.data1!.data2[index].product!,
                      cupit,
                      context),
                  separatorBuilder: (context, index) => slider(context),
                  itemCount: cupit.faveData!.data1!.data2.length);

            }else{
               return const Center(
                  child:  CircularProgressIndicator(),
                );
            }

          }else{
            return const Center(
                  child:  CircularProgressIndicator(),
                );
          }
        });
  }

  Widget faveItem(Product data, ShopCuipt cupit, context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if ((data.image != null && data.image != ""))
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image(
                      image: NetworkImage(
                        data.image!,
                      ),
                      //fit: BoxFit.cover,
                    ),
                  ),
                  if ((data.discount != 0))
                    Container(
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child:  Text(
                            "DISCOUNT",
                            style: TextStyle(fontSize: 12),
                          ),
                        ))
                ],
              ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    data.name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 17, height: 1.3),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        data.price.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16, color: mainColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (data.discount != 0)
                        Text(
                          data.oldPrice.toString(),
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
                            //print(data.id);
                          },
                          icon: const CircleAvatar(
                            backgroundColor: Colors.grey,
                            child:  Icon(Icons.favorite, color: mainColor),
                          ))
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
}
