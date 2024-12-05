import 'package:flutter/material.dart';

abstract class _AppColors {
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;
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
}
