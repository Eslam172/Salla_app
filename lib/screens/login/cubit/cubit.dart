import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/models/login_model.dart';
import 'package:salla_app/screens/login/cubit/states.dart';
import 'package:salla_app/shared/end_points.dart';
import 'package:salla_app/shared/network/remote.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super (LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;
  
  void userLogin(
  {
  required String email,
  required String password,
}
      ){
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email' : email,
          'password' : password,
        }
    ).then((value) {
      loginModel = LoginModel.formJson(value.data);
      print(value.data['message']);
      emit(LoginSuccessState(loginModel));
    }).catchError((error){
      emit(LoginErrorState());
      print(error.toString());
    });
  }
}