import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wallet_app/application/login/login_state.dart';
import 'package:wallet_app/domain/provider/login_service.dart';
import 'package:wallet_app/infrastructure/local_source/local_source.dart';
import 'package:wallet_app/infrastructure/models/login/user_check.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

   bool eyeShow = false;


  void googleAuth()async{
     
     UserCheck info = await LoginService().checkUserExists();

     if(info.check){
      LocalSource.putInfo(key: "UserUUID",json: info.uuid);
      emit(LoginNextMain());
     }else{
      EasyLoading.showInfo(info.message);
     }
  }

  void enterMain()async{

    LoginService().loginWithEmailPassword(emailController.text, passwordController.text);
  }

  void eyePress(){
    eyeShow = !eyeShow;
    emit(LoginInitial());
  }
}