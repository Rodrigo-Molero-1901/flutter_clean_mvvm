part of '../notes_page.dart';

extension _OverlayExtension on NotesOverlay {
  void showOverlay(
    BuildContext context,
    NotesCubit cubit,
    AppLocalizations l10n,
  ) {
    switch (this) {
      case CreateNoteFormOverlay():
        _showCreateNoteFormDialog(context, cubit, l10n);
      case IncreaseFavoriteCountOverlay():
        _showCountSnackBar(context, message: l10n.increased_count);
      case DecreaseFavoriteCountOverlay():
        _showCountSnackBar(context, message: l10n.decreased_count);
      case ServiceErrorOverlay():
        _showServiceErrorDialog(context, l10n);
    }
  }

  void _showCreateNoteFormDialog(
    BuildContext context,
    NotesCubit cubit,
    AppLocalizations l10n,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final titleController = TextEditingController();
        final contentController = TextEditingController();

        return AlertDialog(
          title: Text(l10n.create_note_dialog_title),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.title_field),
                TextFormField(controller: titleController),
                const SizedBox(height: AppSpacing.spacing2x),
                Text(l10n.content_field),
                TextFormField(controller: contentController),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: context.pop,
              child: Text(l10n.cancel_button),
            ),
            ElevatedButton(
              onPressed: () {
                context.pop();
                cubit.createNote(
                  title: titleController.text,
                  content: contentController.text,
                );
              },
              child: Text(l10n.add_button),
            ),
          ],
        );
      },
    );
  }

  void _showCountSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  void _showServiceErrorDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.error_dialog_title),
          content: Text(l10n.error_dialog_content),
          actions: [
            ElevatedButton(
              onPressed: context.pop,
              child: Text(l10n.ok_button),
            ),
          ],
        );
      },
    );
  }
}
