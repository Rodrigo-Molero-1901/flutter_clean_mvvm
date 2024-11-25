import 'package:safe_extensions/safe_extensions.dart';

import '../../../domain/models/note_model.dart';

part 'note_row_view_model.dart';
part 'notes_navigation.dart';
part 'notes_overlay.dart';

class NotesViewModel {
  final List<NoteRowViewModel> noteRowsViewModels;
  final NotesNavigation? navigation;
  final NotesOverlay? overlay;

  NotesViewModel.fromSuccessState({
    required List<NoteModel> notes,
    this.navigation,
    this.overlay,
  })  : noteRowsViewModels = List.from(notes.map(NoteRowViewModel.fromModel));
}
