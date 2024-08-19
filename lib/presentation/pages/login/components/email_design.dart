import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class Email extends StatelessWidget {
  const Email({
    super.key, required this.controller, required this.label, required this.hint,
  });
  final TextEditingController controller;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Text(label,style: AppTheme.data.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
    Gap(ScreenSize.h5),
    TextField(
      controller: controller,
     decoration: InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.only(left: ScreenSize.h10,top: ScreenSize.h12,bottom: ScreenSize.h12),
      fillColor: AppTheme.colors.softGray,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ScreenSize.r12),
        borderSide: BorderSide(
          color: AppTheme.colors.gray1
        )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ScreenSize.r12),
        borderSide: BorderSide(
          color: AppTheme.colors.textSecondary
        )
      )
     ),
    ),
    Gap(ScreenSize.h20)
   ],
 );
}
}