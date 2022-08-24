import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/models/categories_model.dart';
import 'package:salla_app/models/home_model.dart';
import 'package:salla_app/screens/categories_screen.dart';
import 'package:salla_app/screens/favorites_screen.dart';
import 'package:salla_app/screens/products_screen.dart';
import 'package:salla_app/screens/profile_screen.dart';
import 'package:salla_app/shared/components/constants.dart';
import 'package:salla_app/shared/cubit/states.dart';
import 'package:salla_app/shared/end_points.dart';
import 'package:salla_app/shared/network/remote.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens =[
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    ProfileScreen()
  ];
  void changeBottomNav(int index){
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
  
   HomeModel? homeModel;
  
  void getHomeData(){
    emit(GetHomeDataLoadingState());
    
    DioHelper.getData(
        url: HOME,
      token: token
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel!.data.products.length);
      emit(GetHomeDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetHomeDataErrorState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories(){
    emit(GetCategoriesLoadingState());

    DioHelper.getData(
        url: CATEGORIES
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(GetCategoriesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetCategoriesErrorState());
    });
  }
}