import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salla_app/screens/home_screen.dart';
import 'package:salla_app/screens/login/login_screen.dart';
import 'package:salla_app/screens/register/cubit/cubit.dart';
import 'package:salla_app/screens/register/cubit/states.dart';
import 'package:salla_app/shared/components/components.dart';
import 'package:salla_app/shared/styles/colors.dart';

import '../../shared/components/constants.dart';
import '../../shared/network/local.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

   var nameController = TextEditingController();
   var emailController = TextEditingController();
   var passwordController = TextEditingController();
   var phoneController = TextEditingController();
   var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            if(state.registerModel.status == true){
              CacheHelper.saveData(
                  key: 'toke', value: state.registerModel.data!.token)
                  .then((value) {
                token = state.registerModel.data!.token;
                navigateAndFinish(context,  HomeScreen());
                Fluttertoast.showToast(
                  msg: state.registerModel.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              });
            }else {
              Fluttertoast.showToast(
                msg: state.registerModel.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: const AssetImage('assets/images/welcome.png'),
                        width: MediaQuery.of(context).size.width*.2,
                        height: MediaQuery.of(context).size.height*.1,
                        color: Colors.grey[200],
                      ),
                      const SizedBox(height: 15,),
                      Text(
                        'Welcome !',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: GoogleFonts.aclonica().fontFamily),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Create your account',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[300],
                            fontFamily: GoogleFonts.alata().fontFamily),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.white,
                                      spreadRadius: .1)
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundColor: secondColor,
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/user.png',
                                  ),
                                  width: 25,
                                  height: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: GoogleFonts.alata().fontFamily),
                                validator: (String? value){
                                  if(value!.isEmpty){
                                    return 'name must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text(
                                    'User name',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: GoogleFonts.alata().fontFamily),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                      gapPadding: 5),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                      gapPadding: 5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.white,
                                      spreadRadius: .1)
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundColor: secondColor,
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/gmail.png',
                                  ),
                                  width: 25,
                                  height: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: GoogleFonts.alata().fontFamily),
                                validator: (String? value){
                                  if(value!.isEmpty){
                                    return 'email must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text(
                                    'Email',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: GoogleFonts.alata().fontFamily),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                      gapPadding: 5),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                      gapPadding: 5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.white,
                                      spreadRadius: .1)
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundColor: secondColor,
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/lock.png',
                                  ),
                                  width: 25,
                                  height: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: GoogleFonts.alata().fontFamily),
                                obscureText: true,
                                validator: (String? value){
                                  if(value!.isEmpty){
                                    return 'password must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text(
                                    'Password',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: GoogleFonts.alata().fontFamily),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                      gapPadding: 5),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                      gapPadding: 5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.white,
                                      spreadRadius: .1)
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundColor: secondColor,
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/phone.png',
                                  ),
                                  width: 25,
                                  height: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: GoogleFonts.alata().fontFamily),
                                validator: (String? value){
                                  if(value!.isEmpty){
                                    return 'phone must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text(
                                    'Phone',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: GoogleFonts.alata().fontFamily),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                      gapPadding: 5),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                      gapPadding: 5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      ConditionalBuilder(
                        condition:state is !RegisterLoadingState ,
                        builder: (context) =>  ElevatedButton(
                            onPressed: () {
                              if(formKey.currentState!.validate()){
                                cubit.userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text
                                  );

                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        side: const BorderSide(
                                            color: secondColor, width: 1)))),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: secondColor,
                                  fontSize: 20,
                                  fontFamily: GoogleFonts.aclonica().fontFamily),
                            )),
                        fallback: (context) => const Center(child: CircularProgressIndicator()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .29,
                              height: 1,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Or register with',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .29,
                              height: 1,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .22,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                child: Image(
                                  image: AssetImage('assets/images/google.png'),
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .1,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .22,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                child: Image(
                                  image: const AssetImage('assets/images/facebook.png'),
                                  color: Colors.blueAccent.shade700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .1,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .22,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                child: Image(
                                  image: AssetImage('assets/images/twitter.png'),
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: GoogleFonts.alata().fontFamily
                          ),),
                          TextButton(
                              onPressed: (){
                                navigateAndFinish(context, LoginScreen());
                              },
                              child: Text('Login',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: GoogleFonts.alata().fontFamily
                              ),))
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
