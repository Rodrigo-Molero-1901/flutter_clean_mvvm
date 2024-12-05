part of '../notes_page.dart';

class _NotesView extends StatelessWidget {
  final NotesCubit cubit;
  final NotesViewModel viewModel;

  const _NotesView({
    required this.cubit,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    if (viewModel.noteRowsViewModels.isEmpty) {
      return Center(
        child: Text(
          l10n.notes_empty_list,
          textAlign: TextAlign.center,
          style: AppTextStyles.headline.medium,
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultHorizontalPadding,
      ),
      itemCount: viewModel.noteRowsViewModels.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.spacing2x),
      itemBuilder: (context, index) {
        final noteRowViewModel = viewModel.noteRowsViewModels[index];

        return _NoteCard(
          noteRowViewModel: noteRowViewModel,
          onDeleteIconTapped: () => cubit.deleteNote(notePosition: index),
          onFavoriteIconTapped: (isFavorite) {
            isFavorite
                ? cubit.increaseFavoriteCount()
                : cubit.decreaseFavoriteCount();
          },
        );
      },
    );
  }
}
