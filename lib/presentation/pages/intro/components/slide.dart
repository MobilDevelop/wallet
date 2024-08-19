import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class SlidePage extends StatelessWidget {
  const SlidePage({
    super.key, required this.index, required this.introColor, required this.press, required this.controller, required this.skip,
  });
  final int index;
  final Color introColor;
  final VoidCallback press;
  final VoidCallback skip;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10,vertical: ScreenSize.h12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70.r)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: ScreenSize.h10,
                width: index==0? ScreenSize.h40:ScreenSize.h10,
                margin: EdgeInsets.symmetric(horizontal: ScreenSize.h4),
                decoration: BoxDecoration(
                  color: introColor,
                  borderRadius: BorderRadius.circular(ScreenSize.r10)
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: ScreenSize.h10,
                width: index==1? ScreenSize.h40:ScreenSize.h10,
                margin: EdgeInsets.symmetric(horizontal: ScreenSize.h4),
                decoration: BoxDecoration(
                  color: introColor,
                  borderRadius: BorderRadius.circular(ScreenSize.r10)
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: ScreenSize.h10,
                width: index==2? ScreenSize.h40:ScreenSize.h10,
                margin: EdgeInsets.symmetric(horizontal: ScreenSize.h4),
                decoration: BoxDecoration(
                  color: introColor,
                  borderRadius: BorderRadius.circular(ScreenSize.r10)
                ),
              )
            ],
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(vertical: ScreenSize.h10),
            child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                 child: Column(
                   children: [
                     Gap(ScreenSize.h50),
                     Text("Muhammadayubxon",style: AppTheme.data.textTheme.headlineSmall),
                     Gap(ScreenSize.h20),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: ScreenSize.h20),
                       child: Text("asdfasdf asdfasdfas asdfasdfasl asd asdfa sdf asdfa sdf asdfasdfasd ;lkjl;kj asdfasdf ",
                       textAlign: TextAlign.center,
                       style: AppTheme.data.textTheme.titleSmall),
                     ),
                   ],
                 ),
                ),
                Container(
                 child: Column(
                   children: [
                    Gap(ScreenSize.h50),
                     Text("Nomonov",style: AppTheme.data.textTheme.headlineSmall),
                     Gap(ScreenSize.h20),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: ScreenSize.h20),
                       child: Text("asdfasdf asdfasdfas asdfasdfasl asd asdfa sdf asdfa sdf asdfasdfasd ;lkjl;kj asdfasdf ",
                       textAlign: TextAlign.center,
                       style: AppTheme.data.textTheme.titleSmall),
                     ),
                   ],
                 ),
                ),
                Container(
                 child: Column(
                   children: [
                    Gap(ScreenSize.h50),
                     Text("Salom",style: AppTheme.data.textTheme.headlineSmall),
                     Gap(ScreenSize.h20),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: ScreenSize.h20),
                       child: Text("asdfasdf asdfasdfas asdfasdfasl asd asdfa sdf asdfa sdf asdfasdfasd ;lkjl;kj asdfasdf ",
                       textAlign: TextAlign.center,
                       style: AppTheme.data.textTheme.titleSmall),
                     ),
                   ],
                 ),
                ),
              ],
            ),
          )),
          Padding(
            padding:  EdgeInsets.only(bottom: ScreenSize.h30,right: ScreenSize.h5,left: ScreenSize.h10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  opacity: index==2?0:1,
                  child: InkWell(
                    onTap:skip,
                    child: Text("Skip",style: AppTheme.data.textTheme.titleSmall))),
                
                InkWell(
                  onTap: press,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: ScreenSize.h50,
                    width: index==2?180.h:ScreenSize.h50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ScreenSize.r35),
                      color: introColor
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}