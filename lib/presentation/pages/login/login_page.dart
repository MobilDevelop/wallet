

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/application/login/login_cubit.dart';
import 'package:wallet_app/application/login/login_state.dart';
import 'package:wallet_app/presentation/assets/res/app_icons.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';
import 'package:wallet_app/presentation/components/button/border_button.dart';
import 'package:wallet_app/presentation/components/button/main_button.dart';
import 'package:wallet_app/presentation/pages/login/components/login_top_design.dart';
import 'package:wallet_app/presentation/pages/login/components/password_design.dart';
import 'package:wallet_app/presentation/routes/index_routes.dart';

import 'components/email_design.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(),
    child: BlocListener<LoginCubit,LoginState>(listener: (context, state) {
      if(state is LoginNextMain){
        context.pushReplacement(Routes.main.path);
      }
    },
    child: Builder(builder: (context) {
      final LoginCubit cubit = context.read<LoginCubit>();
      return BlocBuilder<LoginCubit,LoginState>(builder: (context, state) => Scaffold(
        backgroundColor: AppTheme.colors.background,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.h20),
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const LoginTop(),
              
              Email(
                label: "Email",
                hint: "Enter your name",
                controller: cubit.emailController,
              ),

              Password(
                controller: cubit.passwordController,
                label: "Password",
                hint: "Enter password",
                showForgot: true,
                eyePress: cubit.eyePress,
                forgotPassword: () {
                  context.push(Routes.forget.path);
                },
                eyeShow: cubit.eyeShow,
              ),
              
              MainButton(text: "Log In", onPressed:cubit.enterMain),
              Gap(ScreenSize.h30),

              BorderButton(
                onPressed: cubit.googleAuth, 
                text: "Log In with Google",
                icon: AppIcons.google),
              Gap(ScreenSize.h20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: AppTheme.data.textTheme.bodyMedium),
                  TextButton(onPressed: (){
                    context.push(Routes.registration.path);
                  }, child: Text("Register here",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.blue,fontWeight: FontWeight.w600)))
                ],
              )

            ],
          ),
        )
      ));
    },),
    ),
    );
  }
}