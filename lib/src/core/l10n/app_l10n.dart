import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_l10n_es.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('es')];

  /// No description provided for @landing_description.
  ///
  /// In es, this message translates to:
  /// **'¡Bienvenid@!\n\nEsta aplicación ha sido creada como un proyecto para demostrar cómo una arquitectura bien estructurada puede ofrecer una experiencia funcional y fluida. Aquí podrás gestionar tus notas de manera sencilla, mientras exploras un diseño limpio que conecta cada capa de la app: desde la presentación hasta la obtención de datos. Espero que este proyecto te inspire y, sobre todo, sea útil para aprender y poner en práctica ideas que potencien tus propias creaciones. ¡Gracias por unirte a este viaje!'**
  String get landing_description;

  /// No description provided for @continue_button.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get continue_button;

  /// No description provided for @notes_title.
  ///
  /// In es, this message translates to:
  /// **'Lista de notas'**
  String get notes_title;

  /// No description provided for @notes_empty_list.
  ///
  /// In es, this message translates to:
  /// **'¡Ups! Parece que todavía no tienes ninguna nota'**
  String get notes_empty_list;

  /// No description provided for @create_note_dialog_title.
  ///
  /// In es, this message translates to:
  /// **'Nueva nota'**
  String get create_note_dialog_title;

  /// No description provided for @title_field.
  ///
  /// In es, this message translates to:
  /// **'Título'**
  String get title_field;

  /// No description provided for @content_field.
  ///
  /// In es, this message translates to:
  /// **'Contenido'**
  String get content_field;

  /// No description provided for @cancel_button.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel_button;

  /// No description provided for @add_button.
  ///
  /// In es, this message translates to:
  /// **'Agregar'**
  String get add_button;

  /// No description provided for @ok_button.
  ///
  /// In es, this message translates to:
  /// **'Ok'**
  String get ok_button;

  /// No description provided for @error_dialog_title.
  ///
  /// In es, this message translates to:
  /// **'Error'**
  String get error_dialog_title;

  /// No description provided for @error_dialog_content.
  ///
  /// In es, this message translates to:
  /// **'Hubo un problema. Intente más tarde.'**
  String get error_dialog_content;

  /// No description provided for @increased_count.
  ///
  /// In es, this message translates to:
  /// **'Contador de favoritos subió'**
  String get increased_count;

  /// No description provided for @decreased_count.
  ///
  /// In es, this message translates to:
  /// **'Contador de favoritos bajó'**
  String get decreased_count;

  /// No description provided for @profile_title.
  ///
  /// In es, this message translates to:
  /// **'Mi perfil'**
  String get profile_title;

  /// No description provided for @name_information_header.
  ///
  /// In es, this message translates to:
  /// **'Nombres:'**
  String get name_information_header;

  /// No description provided for @name_information.
  ///
  /// In es, this message translates to:
  /// **'Rodrigo Molero'**
  String get name_information;

  /// No description provided for @email_information_header.
  ///
  /// In es, this message translates to:
  /// **'Correo:'**
  String get email_information_header;

  /// No description provided for @email_information.
  ///
  /// In es, this message translates to:
  /// **'mobile.ramc.soft@gmail.com'**
  String get email_information;

  /// No description provided for @exit_button.
  ///
  /// In es, this message translates to:
  /// **'Salir'**
  String get exit_button;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
