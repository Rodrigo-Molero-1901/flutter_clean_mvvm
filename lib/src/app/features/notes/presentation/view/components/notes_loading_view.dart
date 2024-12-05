part of '../notes_page.dart';

class _NotesLoadingView extends StatelessWidget {
  const _NotesLoadingView();

  static const _shimmerCount = 5;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultHorizontalPadding,
      ),
      itemCount: _shimmerCount,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.spacing2x),
      itemBuilder: (_, __) => const _NoteCardShimmer(),
    );
  }
}

class _NoteCardShimmer extends StatelessWidget {
  const _NoteCardShimmer();

  static const _shimmerHeight = 95.0;
  static const _shimmerWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _shimmerHeight,
      width: _shimmerWidth,
      decoration: BoxDecoration(
        color: AppContextColors.shimmerCardBackground,
        borderRadius: BorderRadius.circular(
          AppDimensions.defaultHorizontalPadding,
        ),
      ),
    );
  }
}
