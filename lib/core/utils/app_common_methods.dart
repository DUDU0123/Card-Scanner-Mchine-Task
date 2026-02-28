import 'dart:io';

import 'package:business_card_scanner/core/constants/app_constraints.dart';
import 'package:business_card_scanner/core/constants/app_global_keys.dart';
import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:business_card_scanner/features/scan/presentation/widgets/preview_sheet_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
class AppCommonMethods {
  static final phoneRegex = RegExp(r'(\+?\d{1,3}[\s-]?)?\d{10}');
  static final emailRegex = RegExp(r'\b[\w.%+-]+@[\w.-]+\.[A-Za-z]{2,}\b');
  static final websiteRegex = RegExp(r'(https?:\/\/)?(www\.)?[a-z0-9]+\.[a-z]+');

  // photo upload tips
  static final photoUploadTips = [
      (Icons.wb_sunny_outlined,    AppColors.amberColor,  AppColors.amberSoftColor,  'Lighting',     'Avoid shadows'),
      (Icons.crop_free_outlined,   AppColors.tealColor,   AppColors.tealSoftColor,   'Flat Surface', 'Steady & flat'),
      (Icons.hd_outlined,          AppColors.accentColor, AppColors.accentSoft, 'HD Quality',   'Text readable'),
  ];

  static TextStyle commonTextStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    TextOverflow? overflow,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      color: color ?? AppColors.textPrimaryColor,
      fontSize: fontSize ?? 16.sp,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      decoration: decoration,
      overflow: overflow,
      height: height,
      shadows: shadows,
    );
  }

  static void commonSnackBar({
    required String message,
    bool isError = false,
  }) {
    final context = AppGlobalKeys.navigatorKey.currentContext;
    if (context == null) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                isError ? Icons.error_outline : Icons.check_circle_outline,
                color: AppColors.kWhite,
              ),
              AppConstraints.kWidth12,
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: AppColors.kWhite,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: isError ? Colors.redAccent : Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          duration: const Duration(seconds: 1),
        ),
      );
  }
  // image source pick and calling pickimage method from cubit to pick image
  static void showImageSourcePicker({
    required BuildContext context,
    required bool isFrontImage,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  context.read<ScanCubit>().pickImage(
                        source: ImageSource.camera,
                        isFrontImage: isFrontImage,
                      );
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  context.read<ScanCubit>().pickImage(
                        source: ImageSource.gallery,
                        isFrontImage: isFrontImage,
                      );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static void showPreviewSheetOpener() {
    final context = AppGlobalKeys.navigatorKey.currentContext;
    if (context != null) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (_) => PreviewSheetWidget(),
      );
    }
  }
}