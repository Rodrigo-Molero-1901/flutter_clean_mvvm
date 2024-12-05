part of '../profile_page.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final ProfileCubit cubit;

  const _AppBar({
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBar(
      scrolledUnderElevation: 0,
      title: Text(
        l10n.profile_title,
      ),
      leading: IconButton(
        onPressed: context.pop,
        icon: Icon(
          Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
