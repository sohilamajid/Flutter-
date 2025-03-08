import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revision_1/ecommerce/helper/api_url.dart';
import 'package:flutter_revision_1/ecommerce/helper/dio_helper.dart';
import 'package:flutter_revision_1/ecommerce/home/home_screen.dart';
import 'package:get/get.dart';
import '../model/LoginModel.dart';
part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  
  DioHelper _dioHelper = DioHelper();
  LoginModel loginModel = LoginModel();
  
  void login({
    required String email,
    required String password,
})async{
    emit(LoginLoadingState());
    try{
      final response = await _dioHelper.postData(
          path: ApiUrl.login,
          body: {
            "email" : email ,
            "password" : password,
          },
      );
      loginModel = LoginModel.fromJson(response.data);
      if(loginModel.status==true){
        Get.offAll(HomeScreen());
        emit(LoginSuccessState());
      }else{
        Get.snackbar("Error", loginModel.message??"",backgroundColor: Colors.red);
        emit(LoginErrorState());
      }

    }catch(e){
      emit(LoginErrorState());
    }
  }
}
