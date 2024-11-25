part of 'notes_view_model.dart';

class NoteRowViewModel {
  final String title;
  final String content;

  NoteRowViewModel.fromModel(NoteModel model)
      : title = model.title.safeValue,
        content = model.content.safeValue;
}
