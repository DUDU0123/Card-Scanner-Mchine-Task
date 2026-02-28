import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanPageButtons extends StatelessWidget {
  const ScanPageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanCubit, ScanState>(
      builder: (context, state) {
        return Column(
          children: [
            // Show Preview Button
            GestureDetector(
              onTap: () {
                if (state.pickedBackImage == null && state.pickedFrontImage == null) {
                  AppCommonMethods.commonSnackBar(message: "Upload front/back image of see preview", isError: true);
                } else {
                  AppCommonMethods.showPreviewSheetOpener();
                }
              },
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
                if (state.pickedBackImage != null && state.pickedFrontImage != null) {
                  context.read<ScanCubit>().uploadData();
                } else {
                  AppCommonMethods.commonSnackBar(message: "Upload front and back image of the card", isError: true);
                }
              },
              child: Container(
                width: double.infinity,
                height: 54,
                decoration: BoxDecoration(
                  gradient: state.pickedBackImage != null && state.pickedFrontImage != null ? const LinearGradient(
                    colors: [Color(0xFF1D4ED8), Color(0xFF3B82F6)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ) : LinearGradient(
                    colors: [Color.fromARGB(255, 223, 223, 223), Color.fromARGB(255, 213, 214, 215)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: state.pickedBackImage != null && state.pickedFrontImage != null ? [
                    BoxShadow(
                      color: AppColors.accentColor.withOpacity(0.28),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ] : null,
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
      },
    );
  }
}
