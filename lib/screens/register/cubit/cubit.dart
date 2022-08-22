import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/models/login_model.dart';
import 'package:salla_app/models/register_model.dart';
import 'package:salla_app/screens/register/cubit/states.dart';
import 'package:salla_app/shared/end_points.dart';
import 'package:salla_app/shared/network/remote.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  late RegisterModel registerModel;
  void userRegister({
  required String name,
  required String email,
  required String password,
  required String phone,
}){
    emit(RegisterLoadingState());

    DioHelper.postData(
        url: REGISTER,
        data: {
          'name' : name,
          'email' : email,
          'password' : password,
          'phone' : phone,
        }
    ).then((value) {
      registerModel = RegisterModel.formJson(value.data);
      print(registerModel.data!.name);
      emit(RegisterSuccessState(registerModel));
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState());
    });
  }
}