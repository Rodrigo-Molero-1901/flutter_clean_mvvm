import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../models/note_model.dart';
import '../repositories/notes_repository.dart';

@injectable
class CreateNoteUseCase {
  final NotesRepository _repository;

  CreateNoteUseCase(
    this._repository,
  );

  Future<Either<void, NoteModel>> call({required NoteModel note}) async {
    return await _repository.createNote(note: note);
  }
}
