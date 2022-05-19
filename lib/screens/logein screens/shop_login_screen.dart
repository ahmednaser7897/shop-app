import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/homePage.dart';
import 'package:shop_app/screens/logein%20screens/register_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/shared_preferences/shared_preferences.dart';
import 'package:shop_app/shared/shop%20cupit/logein%20cupit/logein_states.dart';
import 'package:shop_app/shared/shop%20cupit/logein%20cupit/login_cuoit.dart';

class ShopLogIn extends StatelessWidget {
  const ShopLogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email =  TextEditingController();
    TextEditingController pass =  TextEditingController();
    var keyf = GlobalKey<FormState>();
    return BlocProvider<LoginCupit>(
      create: (context) => LoginCupit(),
      child: BlocConsumer<LoginCupit, LoginState>(
        listener: (context, state) {
         if(state is ScLoginState){
           if(state.loginModel.status){
             CachHelper.setData(key: 'token', value: state.loginModel.data!.token).then((value) {
               token=state.loginModel.data!.token;
               navigatorAndEnd(context, const MyHomePage());
             });
           }else{
             showToast(state.loginModel.message!, ToastState.ERORR);
           }
         }
          
        },
        builder: (context, stste) {
          LoginCupit cupit=LoginCupit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Form(
                  key: keyf,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("loge in".toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              !.copyWith(color: Colors.black)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("loge in to our shop app",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              !.copyWith(color: Colors.grey)),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          labelStyle: TextStyle(fontSize: 20),
                          prefixIcon: Icon(Icons.email),
                        ),
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) return "email must not be empty";
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "PassWord",
                          labelStyle: const TextStyle(fontSize: 20),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: !cupit.showPass
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              cupit.changeShowPass();
                            },
                          ),
                        ),
                        controller: pass,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: cupit.showPass ? true : false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password must not be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      (stste is LodingLoginState)?const Center(child: CircularProgressIndicator()):Container(
                        width: double.infinity,
                        color: Colors.blue,
                        child: MaterialButton(
                            child: const Text(
                              "loge in",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            onPressed: () {
                              if(keyf.currentState!.validate()){
                                cupit.userLogin(email: email.text, pass: pass.text);
                              }
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text("Do not have an email?",style:  TextStyle(decoration:TextDecoration.underline , fontSize: 15),),
                          const SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            child: Text(
                              "Register".toUpperCase(),
                              style: const TextStyle(color: mainColor, fontSize: 15),
                            ),
                            onPressed: () {
                              navigatorTo(context, const RegisterScreen());
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
