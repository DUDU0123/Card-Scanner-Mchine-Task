import 'dart:io';

import 'package:business_card_scanner/core/utils/app_imports.dart';

Widget scanPageTopInfoBanner() {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: AppColors.accentSoft,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.accentMidColor),
    ),
    child: Row(
      children: [
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.accentColor.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        AppConstraints.kWidth12,
        const Expanded(
          child: Text(
            'Upload clear, well-lit photos of both sides of your card for accurate processing.',
            style: TextStyle(
              color: AppColors.accentColor,
              fontSize: 13,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget labelPreview(String label) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      label,
      style: const TextStyle(
        color: AppColors.textSecondaryColor,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.8,
      ),
    ),
  );
}

Widget uploadedImageShowWidget({required File image}) {
  return Container(
    height: 175,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.borderColor),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowColor,
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    clipBehavior: Clip.hardEdge,
    child: Image.file(image, fit: BoxFit.cover, width: double.infinity),
  );
}
