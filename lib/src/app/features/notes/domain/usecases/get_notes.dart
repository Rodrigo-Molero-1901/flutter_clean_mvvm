import 'package:flutter_clean_mvvm/src/core/network/error/api_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../models/note_model.dart';
import '../repositories/notes_repository.dart';

@injectable
class GetNotesUseCase {
  final NotesRepository _repository;

  GetNotesUseCase(
    this._repository,
  );

  Future<Either<ApiError, List<NoteModel>>> call() async {
    return await _repository.getNotes();
  }
}
