import 'package:injectable/injectable.dart';

import '../repositories/notes_repository.dart';

@injectable
class DecreaseCountUseCase {
  final NotesRepository _repository;

  DecreaseCountUseCase(
    this._repository,
  );

  Future<void> call() async {
    await _repository.decrementFavoriteCount();
  }
}
