part of '../notes_page.dart';

extension _NavigationExtension on NotesNavigation {
  void navigate(BuildContext context) {
    switch (this) {
      case ProfileNavigation():
        context.push(PageRoutes.pathProfilePage);
      // case NoteDetailsNavigation(:final noteId):
      //   context.push(PageRoutes.pathNoteDetailsPage, extra: noteId);
      case ExitNavigation():
        context.pushReplacement(PageRoutes.pathLandingPage);
    }
  }
}
