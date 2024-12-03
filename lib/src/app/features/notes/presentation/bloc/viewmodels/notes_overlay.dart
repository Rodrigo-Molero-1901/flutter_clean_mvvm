part of 'notes_view_model.dart';

sealed class NotesOverlay {}

class CreateNoteOverlay extends NotesOverlay {}

class IncreaseFavoriteCountOverlay extends NotesOverlay {}

class DecreaseFavoriteCountOverlay extends NotesOverlay {}
