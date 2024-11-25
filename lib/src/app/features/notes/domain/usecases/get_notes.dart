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

  Future<Either<void, List<NoteModel>>> call() async {
    return await _repository.getNotes();
  }
}
