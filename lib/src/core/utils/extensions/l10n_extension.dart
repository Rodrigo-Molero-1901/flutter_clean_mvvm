import 'package:flutter/material.dart';

import '../../l10n/app_l10n.dart';

extension LocalizationsExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}