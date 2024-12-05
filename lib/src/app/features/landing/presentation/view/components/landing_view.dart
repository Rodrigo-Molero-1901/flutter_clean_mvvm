part of '../landing_page.dart';

class _LandingView extends StatelessWidget {
  final LandingCubit cubit;

  const _LandingView({
    required this.cubit,
  });

  static const _horizontalPadding = 32.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
              ),
              child: Text(
                l10n.landing_description,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppSpacing.spacing4x),
            ElevatedButton(
              onPressed: cubit.onContinueTapped,
              child: Text(l10n.continue_button),
            ),
          ],
        ),
      ),
    );
  }
}
