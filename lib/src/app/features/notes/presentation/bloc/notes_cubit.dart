import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_extensions/safe_extensions.dart';

import '../../domain/models/note_model.dart';
import '../../domain/usecases/create_note.dart';
import '../../domain/usecases/delete_note.dart';
import '../../domain/usecases/get_notes.dart';
import 'viewmodels/notes_view_model.dart';

part 'notes_state.dart';

@injectable
class NotesCubit extends Cubit<NotesState> {
  final GetNotesUseCase _getNotesUseCase;
  final CreateNoteUseCase _createNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;

  NotesCubit({
    required GetNotesUseCase getNotesUseCase,
    required CreateNoteUseCase createNoteUseCase,
    required DeleteNoteUseCase deleteNoteUseCase,
  })  : _getNotesUseCase = getNotesUseCase,
        _createNoteUseCase = createNoteUseCase,
        _deleteNoteUseCase = deleteNoteUseCase,
        super(NotesInitial());

  var _notes = <NoteModel>[];

  Future<void> initialize() async {
    _emitLoading();
    await _getNotes();
    _emitMain();
  }

  Future<void> _getNotes() async {
    final response = await _getNotesUseCase.call();
    response.fold(
      (error) {},
      (notes) {
        _notes = notes;
      },
    );
  }

  Future<void> _createNote(NoteModel note) async {
    final response = await _createNoteUseCase.call(note: note);
    response.fold(
      (error) {},
      (createdNote) {
        _notes.add(createdNote);
      },
    );
  }

  Future<void> _deleteNote(int? noteId) async {
    final response = await _deleteNoteUseCase.call(noteId: noteId.safeValue);
    response.fold(
      (error) {},
      (noteDeleted) {
        _notes.removeWhere((note) => note.id == noteId);
      },
    );
  }

  void _emitMain({
    NotesNavigation? navigation,
    NotesOverlay? overlay,
  }) {
    emit(
      NotesMain(
        viewModel: NotesViewModel.fromSuccessState(
          notes: _notes,
          navigation: navigation,
          overlay: overlay,
        ),
      ),
    );
  }

  void _emitLoading() => emit(NotesLoading());

  void onCreateNoteTapped() {
    _emitMain(overlay: CreateNoteOverlay());
  }

  void createNote({required String title, required String content}) {
    final note = NoteModel(
      id: _notes.length,
      title: title,
      content: content,
    );
    _createNote(note);
    _emitMain();
  }

  void deleteNote({required int notePosition}) {
    _deleteNote(_notes[notePosition].id);
    _emitMain();
  }
}
