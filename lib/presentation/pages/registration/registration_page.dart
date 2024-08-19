import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/application/registration/registration_cubit.dart';
import 'package:wallet_app/application/registration/registration_state.dart';
import 'package:wallet_app/presentation/assets/res/app_icons.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';
import 'package:wallet_app/presentation/components/button/border_button.dart';
import 'package:wallet_app/presentation/components/button/main_button.dart';
import 'package:wallet_app/presentation/pages/login/components/email_design.dart';
import 'package:wallet_app/presentation/pages/registration/components/registration_top.dart';
import 'package:wallet_app/presentation/routes/index_routes.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => RegistrationCubit(),
     child: BlocListener<RegistrationCubit,RegistrationState>(listener: (_, state) {
       
     },
      child: Builder(builder: (_) {
        RegistrationCubit cubit = _.read<RegistrationCubit>();
        
        return BlocBuilder<RegistrationCubit,RegistrationState>(builder: (_, state) => Scaffold(
          body: Container(
            width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.h20),
            child: ListView(
              children: [
                 RegistrationTop(
                  closePage: () {
                    _.pop();
                  },
                 ),

                Email(
                  controller: cubit.userNameController, 
                  label: "Username", 
                  hint: "Enter your name"),

                Email(
                  controller: cubit.userNameController, 
                  label: "Email", 
                  hint: "Enter your email"),

                Email(
                  controller: cubit.userNameController, 
                  label: "Password", 
                  hint: "Enter password"),

                MainButton(text: "Registration", onPressed: (){}),
                Gap(ScreenSize.h20),

                BorderButton(
                onPressed: (){}, 
                text: "Sign Up with Google",
                icon: AppIcons.google),
                Gap(ScreenSize.h10),

                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: AppTheme.data.textTheme.bodyMedium),
                  TextButton(onPressed: (){
                    _.pop();
                  }, child: Text("Login",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.blue,fontWeight: FontWeight.w600)))
                ],
              )
              ],
            ),
          ),
        ));

      },),
     ),
    );
  }
}