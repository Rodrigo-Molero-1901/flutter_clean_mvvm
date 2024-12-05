import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_extensions/safe_extensions.dart';

import '../../domain/models/note_model.dart';
import '../../domain/usecases/create_note.dart';
import '../../domain/usecases/decrease_count.dart';
import '../../domain/usecases/delete_note.dart';
import '../../domain/usecases/get_notes.dart';
import '../../domain/usecases/increase_count.dart';
import 'viewmodels/notes_view_model.dart';

part 'notes_state.dart';

@injectable
class NotesCubit extends Cubit<NotesState> {
  final GetNotesUseCase _getNotesUseCase;
  final CreateNoteUseCase _createNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;
  final IncreaseCountUseCase _increaseCountUseCase;
  final DecreaseCountUseCase _decreaseCountUseCase;

  NotesCubit({
    required GetNotesUseCase getNotesUseCase,
    required CreateNoteUseCase createNoteUseCase,
    required DeleteNoteUseCase deleteNoteUseCase,
    required IncreaseCountUseCase increaseCountUseCase,
    required DecreaseCountUseCase decreaseCountUseCase,
  })  : _getNotesUseCase = getNotesUseCase,
        _createNoteUseCase = createNoteUseCase,
        _deleteNoteUseCase = deleteNoteUseCase,
        _increaseCountUseCase = increaseCountUseCase,
        _decreaseCountUseCase = decreaseCountUseCase,
        super(NotesInitial());

  var _notes = <NoteModel>[];

  Future<void> initialize() async {
    _emitLoading();
    await _getNotes();
  }

  Future<void> _getNotes() async {
    // Little delay to simulate API call
    await Future.delayed(const Duration(milliseconds: 2000));
    final response = await _getNotesUseCase.call();
    response.fold(
      (error) {
        _emitMain(overlay: ServiceErrorOverlay());
      },
      (notes) {
        _notes = notes;
        _emitMain();
      },
    );
  }

  Future<void> _createNote(NoteModel note) async {
    final response = await _createNoteUseCase.call(note: note);
    response.fold(
      (error) {
        // _emitMain(overlay: ServiceErrorOverlay());
        _notes.add(note);
        _emitMain();
      },
      (createdNote) {
        _notes.add(createdNote);
        _emitMain();
      },
    );
  }

  Future<void> _deleteNote(int? noteId) async {
    final response = await _deleteNoteUseCase.call(noteId: noteId.safeValue);
    response.fold(
      (error) {
        // _emitMain(overlay: ServiceErrorOverlay());
        _notes.removeWhere((note) => note.id == noteId);
        _emitMain();
      },
      (noteDeleted) {
        _notes.removeWhere((note) => note.id == noteId);
        _emitMain();
      },
    );
  }

  void _emitLoading() {
    emit(NotesLoading());
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

  void onProfileTapped() {
    _emitMain(navigation: ProfileNavigation());
  }

  void onCreateNoteTapped() {
    _emitMain(overlay: CreateNoteFormOverlay());
  }

  void createNote({required String title, required String content}) {
    final note = NoteModel(
      id: _notes.length,
      title: title,
      content: content,
    );
    _createNote(note);
  }

  void deleteNote({required int notePosition}) {
    _deleteNote(_notes[notePosition].id);
  }

  Future<void> increaseFavoriteCount() async {
    await _increaseCountUseCase.call();
    _emitMain(overlay: IncreaseFavoriteCountOverlay());
  }

  Future<void> decreaseFavoriteCount() async {
    await _decreaseCountUseCase.call();
    _emitMain(overlay: DecreaseFavoriteCountOverlay());
  }
}
