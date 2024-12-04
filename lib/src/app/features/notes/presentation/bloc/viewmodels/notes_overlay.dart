part of 'notes_view_model.dart';

sealed class NotesOverlay {}

class CreateNoteFormOverlay extends NotesOverlay {}

class ServiceErrorOverlay extends NotesOverlay {}

class IncreaseFavoriteCountOverlay extends NotesOverlay {}

class DecreaseFavoriteCountOverlay extends NotesOverlay {}
