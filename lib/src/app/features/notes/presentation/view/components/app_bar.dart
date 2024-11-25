part of '../notes_page.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final NotesCubit cubit;

  const _AppBar({
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBar(
      title: Text(
        l10n.notes_title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
