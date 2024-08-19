import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class Password extends StatelessWidget {
  const Password({
    super.key, required this.controller, required this.eyePress, required this.eyeShow, required this.forgotPassword, required this.label, required this.hint, this.showForgot,
  });
  final TextEditingController controller;
  final VoidCallback eyePress;
  final VoidCallback forgotPassword;
  final bool eyeShow;
  final String label;
  final String hint;
  final bool? showForgot;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Text(label,style: AppTheme.data.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
    Gap(ScreenSize.h5),
    TextField(
      controller: controller,
      obscureText: !eyeShow,
     decoration: InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.only(left: ScreenSize.h10,top: ScreenSize.h12,bottom: ScreenSize.h12),
      fillColor: AppTheme.colors.softGray,
      suffixIcon: InkWell(
        onTap: eyePress,
        splashColor: Colors.white,
        child:  eyeShow? Icon(Icons.visibility_outlined,color: AppTheme.colors.textSecondary):Icon(Icons.visibility_off_outlined,color: AppTheme.colors.textSecondary)),
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
    Visibility(
      visible: showForgot!=null,
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.centerRight,
        child: TextButton(onPressed: forgotPassword, child: Text("Forgot Password?",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.blue)))),
    ),
    Gap(ScreenSize.h20)
   ],
 );
}
}