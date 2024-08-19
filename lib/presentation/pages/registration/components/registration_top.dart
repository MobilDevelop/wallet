import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class RegistrationTop extends StatelessWidget {
  const RegistrationTop({super.key, required this.closePage});
  final VoidCallback closePage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              InkWell(
                onTap: closePage,
                child: const Icon(Icons.arrow_back)),
              Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Image.asset(AppIcons.login2,height: 150.h)),
              Gap(ScreenSize.h10),
              Text("Registration",style: AppTheme.data.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
              Gap(ScreenSize.h5),
              Text("Enter your personal information",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
              Gap(ScreenSize.h20),
      ],
    );
  }
}