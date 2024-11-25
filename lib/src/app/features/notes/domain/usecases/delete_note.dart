import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../repositories/notes_repository.dart';

@injectable
class DeleteNoteUseCase {
  final NotesRepository _repository;

  DeleteNoteUseCase(
    this._repository,
  );

  Future<Either<void, bool>> call({required int noteId}) async {
    return await _repository.deleteNote(noteId: noteId);
  }
}
