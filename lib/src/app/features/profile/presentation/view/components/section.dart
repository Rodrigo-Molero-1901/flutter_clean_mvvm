part of '../profile_page.dart';

class _InformationSection extends StatelessWidget {
  final String header;
  final String information;

  const _InformationSection({
    required this.header,
    required this.information,
  });

  static const _informationCardWidth = double.infinity;
  static const _informationCardPadding = 12.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: AppTextStyles.title.medium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.spacing1x),
        Container(
          width: _informationCardWidth,
          padding: const EdgeInsets.all(_informationCardPadding),
          decoration: BoxDecoration(
            color: AppContextColors.informationCardBackground,
            borderRadius: BorderRadius.circular(
              AppDimensions.minBorderRadius,
            ),
          ),
          child: Text(
            information,
            style: AppTextStyles.body.medium.copyWith(
              color: AppContextColors.informationCardText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
