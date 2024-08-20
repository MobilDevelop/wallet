import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';

class Helper{
  static int randomNumber(){
      math.Random rng = math.Random();
      return rng.nextInt(17);
  }

  static String dateFormat(DateTime? date){
      return date==null?"": DateFormat('yyyy-MM-dd').format(date);
  }


   static String homeDate(DateTime dateTime){
    
    int day = dateTime.day;
    int year = dateTime.year;

    String month = "";

    switch (dateTime.month) {
      case 1:month = "Yanvar"; break;
      case 2:month = "Fevral"; break;
      case 3:month = "Mart"; break;
      case 4:month = "Aprel"; break;
      case 5:month = "May"; break;
      case 6:month = "Iyun"; break;
      case 7:month = "Iyul"; break;
      case 8:month = "Avgust"; break;
      case 9:month = "Sentyabr"; break;
      case 10:month = "Oktyabr"; break;
      case 11:month = "Noyabr"; break;
      case 12:month = "Dekabr"; break;
    }

    

    return "Bugun $day-$month $year-yil";
  }

  static bool isEmail(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return !regExp.hasMatch(em);
}


  static String toProcessCost(String value) {
    if (value == '0') {
      return '0';
    }

    String valueRealPart = '';
    String number = "";
    if (value.indexOf('.') > 0) {
      valueRealPart = value.substring(value.indexOf('.'), value.length);
      value = value.substring(0, value.indexOf('.'));
    }
    String count = '';
    if (value.length > 3) {
      int a = 0;
      for (int i = value.length; 0 < i; i--) {
        if (a % 3 == 0) {
          count = '${value.substring(i - 1, i)} $count';
        } else {
          count = value.substring(i - 1, i) + count;
        }
        a++;
      }
    } else {
      count = value;
    }
    return count;
  }
}