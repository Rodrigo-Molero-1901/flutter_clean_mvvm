part of 'notes_view_model.dart';

sealed class NotesNavigation {}

class ProfileNavigation extends NotesNavigation {}

class ExitNavigation extends NotesNavigation {}
