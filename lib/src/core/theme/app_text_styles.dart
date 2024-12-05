import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static Headline get headline => Headline();

  static Title get title => Title();

  static Body get body => Body();
}

class Headline {
  TextStyle large = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 1.25,
    color: AppContextColors.defaultText,
  );

  TextStyle medium = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 28,
    height: 1.28,
    color: AppContextColors.defaultText,
  );

  TextStyle small = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 1.33,
    color: AppContextColors.defaultText,
  );
}

class Title {
  TextStyle large = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22,
    height: 1.27,
    color: AppContextColors.defaultText,
  );

  TextStyle medium = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.5,
    letterSpacing: -.15,
    color: AppContextColors.defaultText,
  );

  TextStyle small = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.67,
    letterSpacing: -.1,
    color: AppContextColors.defaultText,
  );
}

class Body {
  TextStyle large = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.5,
    letterSpacing: -.5,
    color: AppContextColors.defaultText,
  );

  TextStyle medium = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.43,
    letterSpacing: -.25,
    color: AppContextColors.defaultText,
  );

  TextStyle small = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.33,
    letterSpacing: -.4,
    color: AppContextColors.defaultText,
  );
}
