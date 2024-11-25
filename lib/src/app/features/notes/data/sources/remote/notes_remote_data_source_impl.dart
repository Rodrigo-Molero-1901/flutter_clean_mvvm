import 'package:flutter_clean_mvvm/src/core/network/api/api_client.dart';
import 'package:flutter_clean_mvvm/src/core/network/error/api_error.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/note_model.dart';
import 'notes_remote_data_source.dart';

@Injectable(as: NotesRemoteDataSource)
class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  final ApiClient _apiClient;

  NotesRemoteDataSourceImpl(
    this._apiClient,
  );

  @override
  Future<List<NoteModel>> getNotes() async {
    try {
      final response = await _apiClient.get('/notes');
      return (response.data as List)
          .map((note) => NoteModel.fromJson(note))
          .toList();
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  @override
  Future<NoteModel> createNote({required NoteModel note}) async {
    try {
      final response = await _apiClient.post('/notes', data: note.toJson());
      return NoteModel.fromJson(response.data);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  @override
  Future<bool> deleteNote({required int noteId}) async {
    try {
      final response = await _apiClient.delete('/notes/$noteId');
      return response.statusCode == 200;
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }
}
