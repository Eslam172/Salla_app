import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salla_app/screens/login/login_screen.dart';
import 'package:salla_app/screens/register/register_screen.dart';
import 'package:salla_app/shared/my_bloc_observer.dart';
import 'package:salla_app/shared/network/remote.dart';
import 'package:salla_app/shared/styles/colors.dart';

void main() {

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:primaryColor,
        scaffoldBackgroundColor: const Color(0xff333742),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff333742),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff333742),
            statusBarBrightness: Brightness.light
          )
        ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
              .copyWith(secondary: secondColor)
      ),
      home:  RegisterScreen(),
    );
  }
}
