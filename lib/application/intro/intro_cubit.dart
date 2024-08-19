import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/intro/intro_state.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class IntroCubit extends Cubit<IntroState>{
  IntroCubit():super(IntroInitial());
  
  int currentIndex = 0;
  Color introColor = AppTheme.colors.intro1;
  PageController pageController = PageController();
  PageController pageControllerText = PageController();

  void nextIndex(){
    if(currentIndex!=2){
      if(currentIndex<2){
      currentIndex++;
    }else{
      currentIndex=0;
    }
    pageController.nextPage(duration: const Duration(milliseconds: 350), curve: Curves.linear);
    pageControllerText.nextPage(duration: const Duration(milliseconds: 350), curve: Curves.linear);
    switch (currentIndex) {
      case 0:introColor = AppTheme.colors.intro1; break;
      case 1:introColor = AppTheme.colors.intro21; break;
      case 2:introColor = AppTheme.colors.intro3; break;
    }
    emit(IntroInitial());
    }else{
     emit(IntroNextLogin());
    }
  }

  void skipPress(){
    if(currentIndex!=2){
      emit(IntroNextLogin());
    }
  }
}