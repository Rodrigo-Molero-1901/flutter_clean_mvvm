import 'package:flutter_clean_mvvm/src/app/features/notes/domain/models/note_model.dart';
import 'package:flutter_clean_mvvm/src/core/network/error/api_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/notes_repository.dart';
import '../sources/local/notes_local_data_source.dart';
import '../sources/remote/notes_remote_data_source.dart';

@Injectable(as: NotesRepository)
class NotesRepositoryImpl implements NotesRepository {
  final NotesRemoteDataSource _remoteSource;
  final NotesLocalDataSource _localSource;

  NotesRepositoryImpl(
    this._remoteSource,
    this._localSource,
  );

  @override
  Future<Either<ApiError, List<NoteModel>>> getNotes() async {
    try {
      final notes = await _remoteSource.getNotes();
      return Right(notes);
    } catch (e) {
      return Left(e as ApiError);
    }
  }

  @override
  Future<Either<ApiError, NoteModel>> createNote(
      {required NoteModel note}) async {
    try {
      final createdNote = await _remoteSource.createNote(note: note);
      return Right(createdNote);
    } catch (e) {
      return Left(e as ApiError);
    }
  }

  @override
  Future<Either<ApiError, bool>> deleteNote({required int noteId}) async {
    try {
      final noteWasDeleted = await _remoteSource.deleteNote(noteId: noteId);
      return Right(noteWasDeleted);
    } catch (e) {
      return Left(e as ApiError);
    }
  }

  @override
  Future<void> incrementFavoriteCount() async {
    await _localSource.incrementFavoriteCount();
  }

  @override
  Future<void> decrementFavoriteCount() async {
    await _localSource.decrementFavoriteCount();
  }
}
