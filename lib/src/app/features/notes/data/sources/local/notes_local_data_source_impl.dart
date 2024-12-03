import 'package:flutter_clean_mvvm/src/core/network/api/local_api_client.dart';
import 'package:flutter_clean_mvvm/src/core/utils/constants/preferences_keys.dart';
import 'package:injectable/injectable.dart';

import 'notes_local_data_source.dart';

@Injectable(as: NotesLocalDataSource)
class NotesLocalDataSourceImpl implements NotesLocalDataSource {
  final LocalApiClient _localApiClient;

  NotesLocalDataSourceImpl(
    this._localApiClient,
  );

  @override
  Future<void> incrementFavoriteCount() async {
    try {
      var currentCount = _localApiClient.getInt(PreferencesKeys.favoriteCount);
      currentCount++;
      await _localApiClient.setInt(
        PreferencesKeys.favoriteCount,
        value: currentCount,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> decrementFavoriteCount() async {
    try {
      var currentCount = _localApiClient.getInt(PreferencesKeys.favoriteCount);
      currentCount--;
      await _localApiClient.setInt(
        PreferencesKeys.favoriteCount,
        value: currentCount,
      );
    } catch (_) {
      rethrow;
    }
  }
}
