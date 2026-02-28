import 'package:business_card_scanner/core/utils/app_imports.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textSecondaryColor),
        AppConstraints.kWidth7,
        Text(
          label,
          style: AppCommonMethods.commonTextStyle(
            color: AppColors.textSecondaryColor,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
          ),
        ),
      ],
    );
  }
}