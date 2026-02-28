import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/scan/cubit/scan_cubit.dart';
import 'package:business_card_scanner/features/scan/widgets/scan_page_small_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewSheetWidget extends StatelessWidget {
  const PreviewSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanCubit, ScanState>(
      builder: (context, state) {
        return SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            ),
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                AppConstraints.kHeight22,
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.accentSoft,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.preview_outlined,
                        color: AppColors.accentColor,
                        size: 20,
                      ),
                    ),
                    AppConstraints.kWidth12,
                    const Text(
                      'Card Preview',
                      style: TextStyle(
                        color: AppColors.textPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                AppConstraints.kHeight22,
                if (state.pickedFrontImage != null) ...[
                  labelPreview('FRONT SIDE'),
                  const SizedBox(height: 8),
                  uploadedImageShowWidget(image: state.pickedFrontImage!),
                  const SizedBox(height: 18),
                ],
                if (state.pickedBackImage != null) ...[
                  labelPreview('BACK SIDE'),
                  const SizedBox(height: 8),
                  uploadedImageShowWidget(image: state.pickedBackImage!),
                  const SizedBox(height: 18),
                ],
                if (state.pickedFrontImage == null && state.pickedBackImage == null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      children: [
                        Icon(
                          Icons.image_not_supported_outlined,
                          color: AppColors.textSecondaryColor,
                          size: 44,
                        ),
                        AppConstraints.kHeight12,
                        Text(
                          'No images uploaded yet',
                          style: TextStyle(
                            color: AppColors.textSecondaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.borderColor),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Close',
                      style: AppCommonMethods.commonTextStyle(
                        color: AppColors.textPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
