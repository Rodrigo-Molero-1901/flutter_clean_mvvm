import 'app_l10n.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get landing_description =>
      '¡Bienvenid@!\n\nEsta aplicación ha sido creada como un proyecto para demostrar cómo una arquitectura bien estructurada puede ofrecer una experiencia funcional y fluida. Aquí podrás gestionar tus notas de manera sencilla, mientras exploras un diseño limpio que conecta cada capa de la app: desde la presentación hasta la obtención de datos. Espero que este proyecto te inspire y, sobre todo, sea útil para aprender y poner en práctica ideas que potencien tus propias creaciones. ¡Gracias por unirte a este viaje!';

  @override
  String get continue_button => 'Continuar';

  @override
  String get notes_title => 'Lista de notas';

  @override
  String get notes_empty_list =>
      '¡Ups! Parece que todavía no tienes ninguna nota';

  @override
  String get create_note_dialog_title => 'Nueva nota';

  @override
  String get title_field => 'Título';

  @override
  String get content_field => 'Contenido';

  @override
  String get cancel_button => 'Cancelar';

  @override
  String get add_button => 'Agregar';

  @override
  String get ok_button => 'Ok';

  @override
  String get error_dialog_title => 'Error';

  @override
  String get error_dialog_content => 'Hubo un problema. Intente más tarde.';

  @override
  String get increased_count => 'Contador de favoritos subió';

  @override
  String get decreased_count => 'Contador de favoritos bajó';

  @override
  String get profile_title => 'Mi perfil';

  @override
  String get name_information_header => 'Nombres:';

  @override
  String get name_information => 'Rodrigo Molero';

  @override
  String get email_information_header => 'Correo:';

  @override
  String get email_information => 'mobile.ramc.soft@gmail.com';

  @override
  String get exit_button => 'Salir';
}
