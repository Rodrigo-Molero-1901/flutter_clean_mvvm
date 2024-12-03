import 'package:injectable/injectable.dart';

import '../repositories/notes_repository.dart';

@injectable
class IncreaseCountUseCase {
  final NotesRepository _repository;

  IncreaseCountUseCase(
    this._repository,
  );

  Future<void> call() async {
    await _repository.incrementFavoriteCount();
  }
}
