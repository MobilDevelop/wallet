import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class ForgetTop2 extends StatelessWidget {
  const ForgetTop2({super.key, required this.closePage});
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
                child: Image.asset(AppIcons.login4)),
              Gap(ScreenSize.h40),
              Text("OTP Verification",style: AppTheme.data.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
              Gap(ScreenSize.h5),
              Padding(
                padding: EdgeInsets.only(right: ScreenSize.h30),
                child: Text("Enter the verification code we just send on your email address",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
              ),
              Gap(ScreenSize.h50),
      ],
    );
  }
}