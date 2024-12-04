part of '../notes_page.dart';

extension _OverlayExtension on NotesOverlay {
  void showOverlay(BuildContext context) {
    switch (this) {
      case CreateNoteFormOverlay():
      case IncreaseFavoriteCountOverlay():
      case DecreaseFavoriteCountOverlay():
      case ServiceErrorOverlay():
    }
  }
}
