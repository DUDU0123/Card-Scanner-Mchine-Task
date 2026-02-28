import 'package:business_card_scanner/core/utils/app_imports.dart';

class TipsShowingWidget extends StatelessWidget {
  const TipsShowingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 16,
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            AppConstraints.kWidth8,
            Text(
              'TIPS FOR BEST RESULTS',
              style: AppCommonMethods.commonTextStyle(
                color: AppColors.textSecondaryColor,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.6,
              ),
            ),
          ],
        ),
        AppConstraints.kHeight12,
        Row(
          children: AppCommonMethods.photoUploadTips.map((t) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: t == AppCommonMethods.photoUploadTips.last ? 0 : 10,
                ),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderColor),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: t.$3,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(t.$1, color: t.$2, size: 18),
                      ),
                      AppConstraints.kHeight10,
                      Text(
                        t.$4,
                        style: const TextStyle(
                          color: AppColors.textPrimaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      AppConstraints.kHeight2,
                      Text(
                        t.$5,
                        style: AppCommonMethods.commonTextStyle(
                          color: AppColors.textSecondaryColor,
                          fontSize: 10,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
