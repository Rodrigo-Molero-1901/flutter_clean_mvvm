part of '../landing_page.dart';

extension _OverlayExtension on LandingNavigation {
  void navigate(BuildContext context) {
    switch (this) {
      case NotesNavigation():
        context.pushReplacement(PageRoutes.pathNotesPage);
    }
  }
}
