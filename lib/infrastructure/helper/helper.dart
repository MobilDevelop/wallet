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


  static String printDuration(Duration duration) {
  String negativeSign = duration.isNegative ? '-' : '';
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
  return "$negativeSign$twoDigitMinutes:$twoDigitSeconds";
}

  static String timeFormat(String date){
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    DateTime inputDate = DateTime.parse(parseDate.toString());  
    DateFormat outputFormat = DateFormat('hh:mm');
    String outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
  static String formattingDate(String date){
    if(date.isNotEmpty){
    DateTime parseDate = DateFormat('dd-MM-yyyy hh:mm:ss').parse(date);
    DateTime inputDate = DateTime.parse(parseDate.toString());  
    DateFormat outputFormat = DateFormat('dd-MM-yyyy HH:mm');
    String outputDate = outputFormat.format(inputDate);
    return outputDate;
    }else{
      return '';
    }
  }

   static String dateTimeFormat(String date){
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    DateTime inputDate = DateTime.parse(parseDate.toString());  
    DateFormat outputFormat = DateFormat('yyyy-MM-dd  hh:mm:ss');
    String outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static bool isEmail(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return !regExp.hasMatch(em);
}


static String chooseType(int count){
  switch (count) {
    case 1:return tr('basket.count1');
    case 2:return tr('basket.count2');
    case 3:return tr('basket.count2');
    case 4:return tr('basket.count2');
    default: return tr('basket.count');
  }
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

 static String priceFormat(String numberText) {
    if (numberText.isEmpty) return "";
    int number = int.parse(numberText.replaceAll(" ", ""));
    final List<String> parts = [];
    final String numberStr = number.toString();

    int i = numberStr.length;
    while (i > 0) {
      final int j = i - 3;
      parts.add(numberStr.substring(j < 0 ? 0 : j, i));
      i = j;
    }
    return parts.reversed.join(' ');
  }

  static String checkPersend(double oldPrice,double price){
     if(oldPrice==0){
      return "0";
     }
     double result = (oldPrice-price)/oldPrice*100;

     return "${result.round()} %";
  }
 

}