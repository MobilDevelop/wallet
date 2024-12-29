import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';

class Helper{
  static int randomNumber(){
      math.Random rng = math.Random();
      return rng.nextInt(17);
  }

  

  static String dateFormat(String date){
    DateTime parseDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    DateTime inputDate = DateTime.parse(parseDate.toString());  
    return "${inputDate.day}-${Helper.monthReturned(inputDate.month)}";
  }

  static String timeFormat(String date){
    DateTime parseDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    DateTime inputDate = DateTime.parse(parseDate.toString());  
    DateFormat outputFormat = DateFormat('hh:mm');
    String outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

   static String homeDate(DateTime dateTime){
    
    int day = dateTime.day;
    int year = dateTime.year;
    String month = monthReturned(dateTime.month);

    return "Bugun $day-$month $year-yil";
  }


  static String monthReturned(int index){
   switch (index) {
     case 1: return "Yanvar";
     case 2: return "Fevral";
     case 3: return "Mart";
     case 4: return "Aprel";
     case 5: return "May";
     case 6: return "Iyun";
     case 7: return "Iyul";
     case 8: return "Avgust";
     case 9: return "Sentyabr";
     case 10: return "Oktyabr";
     case 11: return "Noyabr";
     case 12: return "Dekabr";

     default: return "";
    }
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