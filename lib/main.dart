import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salla_app/screens/home_screen.dart';
import 'package:salla_app/screens/login/login_screen.dart';
import 'package:salla_app/screens/on_board_screen.dart';
import 'package:salla_app/screens/register/register_screen.dart';
import 'package:salla_app/shared/components/constants.dart';
import 'package:salla_app/shared/cubit/cubit.dart';
import 'package:salla_app/shared/my_bloc_observer.dart';
import 'package:salla_app/shared/network/local.dart';
import 'package:salla_app/shared/network/remote.dart';
import 'package:salla_app/shared/styles/colors.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  print(onBoarding);

   token = CacheHelper.getData(key: 'token');
   print(token);

   late Widget widget;

   if(onBoarding != null){
     if(token != null){
       widget =  HomeScreen();
     }else {
       widget = LoginScreen();
     }
   }else {
     widget = const OnBoardScreen();
   }

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp( MyApp(
    onBoarding: onBoarding,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final onBoarding;

  final startWidget;

  MyApp({this.onBoarding, this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getHomeData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor:primaryColor,
          scaffoldBackgroundColor: const Color(0xff333742),
          appBarTheme:  AppBarTheme(
            titleSpacing: 20,
            titleTextStyle: TextStyle(
              //color: Colors.white,
              fontSize: 18,
              fontFamily: GoogleFonts.aclonica().fontFamily
            ),
            backgroundColor: const Color(0xff333742),
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xff333742),
              statusBarBrightness: Brightness.light
            )
          ),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
                .copyWith(secondary: secondColor)
        ),
        home:  startWidget,
      ),
    );
  }
}
