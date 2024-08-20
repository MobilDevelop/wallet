import 'package:easy_localization/easy_localization.dart';
import 'package:rive/rive.dart';
import 'package:wallet_app/presentation/assets/res/app_icons.dart';

class RiveAsset{
  final String artboard;
  final String src;
  final String stateMachineName;
  final String title;
  SMIBool? input;

  RiveAsset({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input
  });

  set setInput(SMIBool status){
    input = status;
  }

}
List<RiveAsset> sideMenus = [
  RiveAsset(src: AppIcons.rivicons, artboard: "HOME", stateMachineName: 'HOME_interactivity', title: tr('main.home')), 
  RiveAsset(src: AppIcons.rivicons, artboard: "LIKE/STAR", stateMachineName: "STAR_Interactivity", title: tr('main.expenses')),
  RiveAsset(src: AppIcons.rivicons, artboard: "REFRESH/RELOAD", stateMachineName: 'RELOAD_Interactivity', title: tr('main.statistic')),
  RiveAsset(src: AppIcons.rivicons, artboard: "USER", stateMachineName: 'USER_Interactivity', title: tr('main.profile')),
];