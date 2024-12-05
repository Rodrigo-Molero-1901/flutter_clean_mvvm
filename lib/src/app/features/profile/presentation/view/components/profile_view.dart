part of '../profile_page.dart';

class _ProfileView extends StatelessWidget {
  final ProfileCubit cubit;

  const _ProfileView({
    required this.cubit,
  });

  static const _profileIconSize = 64.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.defaultVerticalPadding,
        horizontal: AppDimensions.defaultHorizontalPadding,
      ),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.spacing4x),
          const CircleAvatar(
            radius: _profileIconSize,
            backgroundColor: AppContextColors.profileIconBackground,
            child: Icon(
              Icons.person,
              size: _profileIconSize,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing5x),
          _InformationSection(
            header: l10n.name_information_header,
            information: l10n.name_information,
          ),
          const SizedBox(height: AppSpacing.spacing2x),
          _InformationSection(
            header: l10n.email_information_header,
            information: l10n.email_information,
          ),
          const SizedBox(height: AppSpacing.spacing6x),
          ElevatedButton(
            onPressed: cubit.onExitTapped,
            child: Text(
              l10n.exit_button,
            ),
          ),
        ],
      ),
    );
  }
}
