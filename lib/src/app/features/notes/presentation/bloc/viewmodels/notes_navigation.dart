part of 'notes_view_model.dart';

sealed class NotesNavigation {}

class NoteDetailsNavigation extends NotesNavigation {}

class ProfileNavigation extends NotesNavigation {}
