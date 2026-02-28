import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/dashboard/presentation/pages/dashboard.dart';

class ScanPageAppbar extends StatelessWidget {
  const ScanPageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        border: const Border(
          bottom: BorderSide(color: AppColors.borderColor, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card Scanner',
                  style: AppCommonMethods.commonTextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  'Upload front & back images',
                  style: AppCommonMethods.commonTextStyle(
                    color: AppColors.textSecondaryColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              AppGlobalKeys.navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) {
                return Dashboard();
              },));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.tealSoftColor,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.tealColor.withAlpha(100)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.file_copy_rounded,
                    color: AppColors.tealColor,
                    size: 13,
                  ),
                  AppConstraints.kWidth5,
                  Text(
                    'See uploaded cards',
                    style: AppCommonMethods.commonTextStyle(
                      color: AppColors.tealColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
