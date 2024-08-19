import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/application/forget/forget_cubit.dart';
import 'package:wallet_app/application/forget/forget_state.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';
import 'package:wallet_app/presentation/components/button/main_button.dart';
import 'package:wallet_app/presentation/pages/forget/components/forget_top1.dart';
import 'package:wallet_app/presentation/pages/forget/components/forget_top2.dart';
import 'package:wallet_app/presentation/pages/forget/components/forget_top3.dart';
import 'package:wallet_app/presentation/pages/login/components/email_design.dart';
import 'package:wallet_app/presentation/pages/login/components/password_design.dart';
import 'package:wallet_app/presentation/routes/index_routes.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ForgetCubit(),
    child: BlocListener<ForgetCubit,ForgetState>(listener: (_, state) {
      
    },
    child: Builder(builder: (_) {
      ForgetCubit cubit = _.read<ForgetCubit>();


      return BlocBuilder<ForgetCubit,ForgetState>(builder: (_, state) => Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.h20),
          child: cubit.chooseView==1? ListView(
            children: [
              ForgetTop1(closePage: (){
                _.pop();
              }),

              Email(controller: cubit.emailController, label: "Email", hint: "Enter your email"),
              Gap(ScreenSize.h5),

              MainButton(text: "Send Code", onPressed: ()=>cubit.setView(2))
            ],
          )
          
          :cubit.chooseView==2?ListView(
             children: [
              ForgetTop2(closePage: ()=>cubit.setView(1)),
                OtpTextField(
                  numberOfFields: 5,
                  enabledBorderColor: AppTheme.colors.blue
                  ,
                  focusedBorderColor: AppTheme.colors.blue,
                  fieldWidth: ScreenSize.h45,
                  margin: EdgeInsets.symmetric(horizontal: ScreenSize.h5),
                  borderRadius: BorderRadius.circular(ScreenSize.r12),
                  textStyle: AppTheme.data.textTheme.titleMedium,
                  showFieldAsBox: true,
                  keyboardType: TextInputType.number,
                  onSubmit: (String verificationCode){
                    print(verificationCode);
                  },
               ),
               Gap(ScreenSize.h40),

               MainButton(text: "Verify", onPressed: ()=>cubit.setView(3)),
               Gap(ScreenSize.h6),

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't received code?",style: AppTheme.data.textTheme.bodyMedium),
                  TextButton(onPressed: (){
                    
                  }, child: Text("Resend",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.blue,fontWeight: FontWeight.w600)))
                ],
              )
            ],
         ).animate().scale()
          
          
          :ListView(
        children: [
          ForgetTop3(closePage: ()=>cubit.setView(2)),
          
          Password(
            controller: cubit.pass1Controller, 
            eyePress: ()=>cubit.eyeShow(1), 
            eyeShow: cubit.eye1, 
            forgotPassword: (){}, 
            label: "Password", 
            hint: "Enter password"),

            Password(
            controller: cubit.pass2Controller, 
            eyePress: ()=>cubit.eyeShow(2), 
            eyeShow: cubit.eye2, 
            forgotPassword: (){}, 
            label: "Confirm Password", 
            hint: "Enter confirm password"),
            Gap(ScreenSize.h20),

            MainButton(text: "Reset Password", onPressed: (){})
        ],
      ).animate().scale()
        ),
      ));
    },),
    ),
    );
  }
}