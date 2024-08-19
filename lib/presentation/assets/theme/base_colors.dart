import 'dart:ui';

abstract class BaseColors {
  const BaseColors();

  Color get primary => const Color.fromRGBO(21, 116, 170, 1);

  Color get stroke => const Color.fromRGBO(50, 58, 70, 1);
  Color get intro1 => const Color.fromRGBO(0,147,178,1);
  Color get intro2 => const Color.fromRGBO(227,238,234,1);
  Color get intro21 => const Color.fromRGBO(24,102,114,1);
  Color get intro3 => const Color.fromRGBO(75,94,229,1);

  Color get white => const Color.fromRGBO(255, 255, 255, 1);
  Color get red => const Color.fromRGBO(255, 97, 45, 1);
  Color get blue => const Color.fromRGBO(96, 160, 196, 1);
  Color get softBlue => const Color.fromRGBO(232, 241, 246, 1);
  Color get softGray => const Color.fromRGBO(249,249,249, 1);
  Color get gray1 => const Color.fromRGBO(235,235,235, 1);

  Color get black => const Color.fromRGBO(0, 0, 0, 1);
  Color get text900 => const Color.fromRGBO(0, 0, 0, 1);
  Color get text800 => const Color.fromRGBO(54, 69, 79, 1);
  Color get text700 => const Color.fromRGBO(51, 51, 51, 1);
 
  Color get textSecondary => const Color.fromRGBO(137, 143, 147, 1);

  Color get background;
}
