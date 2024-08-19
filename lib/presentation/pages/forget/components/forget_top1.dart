import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class ForgetTop1 extends StatelessWidget {
  const ForgetTop1({super.key, required this.closePage});
  final VoidCallback closePage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              InkWell(
                onTap: closePage,
                child: const Icon(Icons.arrow_back)),
              Gap(ScreenSize.h20),
              Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Image.asset(AppIcons.login3)),
              Gap(ScreenSize.h40),
              Text("Forget Password?",style: AppTheme.data.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
              Gap(ScreenSize.h5),
              Padding(
                padding: EdgeInsets.only(right: ScreenSize.h30),
                child: Text("Don't worry! It occurs. Please enter the email adress linked with your account",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
              ),
              Gap(ScreenSize.h30),
      ],
    );
  }
}