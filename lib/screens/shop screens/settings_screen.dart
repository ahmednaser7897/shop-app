
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_cupit.dart';
import 'package:shop_app/shared/shop%20cupit/shop%20cupit/shop_state.dart';


// ignore: must_be_immutable
class   SettingsScreen extends StatelessWidget{
  var tn=TextEditingController();
  var tp=TextEditingController();
  var te=TextEditingController();
  var keyf = GlobalKey<FormState>();

  SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ShopCuipt cupit = ShopCuipt.get(context);
    return BlocConsumer<ShopCuipt, ShopState>(
        listener: (context, state) {
          if(state is ScprofilePage){
            if(cupit.loginModel!.data!=null) tn.text=cupit.loginModel!.data!.name;
            if(cupit.loginModel!.data!=null) te.text=cupit.loginModel!.data!.email;
            if(cupit.loginModel!.data!=null) tp.text=cupit.loginModel!.data!.phone;
          }
          if(state is ScUpdateProfilePage){
            if(state.loginModel.status){
              showToast(state.loginModel.message!, ToastState.SUCCESS);
            }else{
              showToast(state.loginModel.message!, ToastState.ERORR);
            }
            
          }
        },
        builder: (context, state) {
          if(cupit.loginModel!=null){
            if(cupit.loginModel!.data!=null){
              return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Form(
                  key: keyf,
                  child: Column(
                    children: [
                      if(state is LodinUpdateProfilePage)
                      const LinearProgressIndicator(),
                       const SizedBox(height: 20,),
                      TextFormField( 
                        onFieldSubmitted: (value){
                           
                        },              
                        controller: tn, keyboardType: TextInputType.text,
                        validator: (value){
                        if(value!.isEmpty) {
                          return "Fild must not be embty";
                        } else {
                          return null;
                        }},
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: const InputDecoration(
                          border:OutlineInputBorder() ,
                          labelText: "Name",//:"بحث",
                          labelStyle: TextStyle(color:mainColor,fontWeight: FontWeight.bold,fontSize: 15) ,
                          prefixIcon:Icon(Icons.person,color:mainColor,size: 20,) ,
                          prefixStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),
                        ),
                      ),
                      const SizedBox(height: 20,),
                        TextFormField( 
                        onFieldSubmitted: (value){
                          if(keyf.currentState!.validate()){
                            print(value);
                          }  
                        },              
                        controller: te, keyboardType: TextInputType.text,
                        validator: (value){
                        if(value!.isEmpty) {
                          return "Fild must not be embty";
                        } else {
                          return null;
                        }},
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: const InputDecoration(
                          border:OutlineInputBorder() ,
                          labelText: "Email",//:"بحث",
                          labelStyle:  TextStyle(color:mainColor,fontWeight: FontWeight.bold,fontSize: 15) ,
                          prefixIcon: Icon(Icons.email,color:mainColor,size: 20,) ,
                          prefixStyle:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),
                        ),
                      ),
                      const SizedBox(height: 20,),
                        TextFormField( 
                        onFieldSubmitted: (value){
                          if(keyf.currentState!.validate()){
                            print(value);
                          }  
                        },              
                        controller: tp, keyboardType: TextInputType.number,
                        validator: (value){
                        if(value!.isEmpty) {
                          return "Fild must not be embty";
                        } else {
                          return null;
                        }},
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: const InputDecoration(
                          border:OutlineInputBorder() ,
                          labelText: "Phone",//:"بحث",
                          labelStyle: TextStyle(color:mainColor,fontWeight: FontWeight.bold,fontSize: 15) ,
                          prefixIcon:Icon(Icons.phone,color:mainColor,size: 20,) ,
                          prefixStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),
                        ),
                      ),
                      const SizedBox(height: 20,),
                       MaterialButton(
                        minWidth: double.infinity,
                        color: mainColor,
                        child: const Text("Update"),
                        onPressed: (){
                          if(keyf.currentState!.validate()){
                            cupit.updateProfile(email: te.text,name: tn.text,number: tp.text);
                          }
                        },
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        color: mainColor,
                        child: const Text("loge out"),
                        onPressed: ()=>logeOut(context),
                      ),
                     

                    ],
                  ),
                ),
              ),
            );
            
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
        }
        );
  }
}
