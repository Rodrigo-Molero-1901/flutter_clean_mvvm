import 'package:flutter_clean_mvvm/src/core/network/error/api_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../repositories/notes_repository.dart';

@injectable
class DeleteNoteUseCase {
  final NotesRepository _repository;

  DeleteNoteUseCase(
    this._repository,
  );

  Future<Either<ApiError, bool>> call({required int noteId}) async {
    return await _repository.deleteNote(noteId: noteId);
  }
}
