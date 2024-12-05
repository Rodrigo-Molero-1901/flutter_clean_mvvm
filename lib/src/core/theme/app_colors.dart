import 'package:flutter/material.dart';

abstract class _AppColors {
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;
  static const periwinkleGrey = Color(0xFFD1C4E9);
  static const lightPastelPurple = Color(0xFFB39DDB);
  static const darkPastelPurple = Color(0xFF9575CD);
}

abstract class AppContextColors {
  // Common
  static const defaultText = _AppColors.black;
  static const defaultBackground = _AppColors.white;

  // Notes Page
  static const shimmerCardBackground = _AppColors.grey;
  static const noteCardBackground = _AppColors.darkPastelPurple;
  static const noteCardText = _AppColors.white;
  static const noteIcon = _AppColors.white;

  // Profile Page
  static const profileIconBackground = _AppColors.periwinkleGrey;
  static const informationCardBackground = _AppColors.lightPastelPurple;
  static const informationCardText = _AppColors.white;
}
