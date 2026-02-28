import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanPageButtons extends StatelessWidget {
  const ScanPageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Show Preview Button
        GestureDetector(
          onTap: AppCommonMethods.showPreviewSheetOpener,
          child: Container(
            width: double.infinity,
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.accentColor, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentColor.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.visibility_outlined,
                  color: AppColors.accentColor,
                  size: 20,
                ),
                AppConstraints.kWidth10,
                Text(
                  'Show Preview',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        AppConstraints.kHeight12,
        // Upload Button
        GestureDetector(
          onTap: () {
            context.read<ScanCubit>().uploadData();
          },
          child: Container(
            width: double.infinity,
            height: 54,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1D4ED8), Color(0xFF3B82F6)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentColor.withOpacity(0.28),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                AppConstraints.kWidth10,
                Text(
                  'Upload Card',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
