import 'package:flutter_clean_mvvm/src/core/network/error/api_error.dart';
import 'package:fpdart/fpdart.dart';

import '../models/note_model.dart';

abstract class NotesRepository {
  Future<Either<ApiError, List<NoteModel>>> getNotes();

  Future<Either<ApiError, NoteModel>> createNote({required NoteModel note});

  Future<Either<ApiError, bool>> deleteNote({required int noteId});
}
