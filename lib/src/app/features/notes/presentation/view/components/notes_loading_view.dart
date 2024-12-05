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

class _NoteCardShimmer extends StatefulWidget {
  const _NoteCardShimmer();

  static const _shimmerHeight = 95.0;
  static const _shimmerWidth = double.infinity;

  @override
  State<_NoteCardShimmer> createState() => _NoteCardShimmerState();
}

class _NoteCardShimmerState extends State<_NoteCardShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.65, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Container(
            height: _NoteCardShimmer._shimmerHeight,
            width: _NoteCardShimmer._shimmerWidth,
            decoration: BoxDecoration(
              color: AppContextColors.shimmerCardBackground,
              borderRadius: BorderRadius.circular(
                AppDimensions.defaultHorizontalPadding,
              ),
            ),
          ),
        );
      },
    );
  }
}
