import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class ForgetTop3 extends StatelessWidget {
  const ForgetTop3({super.key, required this.closePage});
  final VoidCallback closePage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              InkWell(
                onTap: closePage,
                child: const Icon(Icons.arrow_back)),
              Gap(ScreenSize.h5),
              Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Image.asset(AppIcons.login5)),
              Gap(ScreenSize.h10),
              Text("Create new Password",style: AppTheme.data.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
              Gap(ScreenSize.h5),
              Padding(
                padding: EdgeInsets.only(right: ScreenSize.h30),
                child: Text("Your new password must be unique from those previously used",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
              ),
              Gap(ScreenSize.h20),
      ],
    );
  }
}