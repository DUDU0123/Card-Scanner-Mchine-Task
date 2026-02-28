import 'dart:io';

import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/scan/widgets/image_empty_slot_widget.dart';
import 'package:business_card_scanner/features/scan/widgets/image_filled_slot_widget.dart';

class ImageUploadSlotWidget extends StatelessWidget {
  const ImageUploadSlotWidget({super.key, required this.isFront, this.image});
  final bool isFront;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppCommonMethods.showImageSourcePicker(context: context, isFrontImage: isFront);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 175,
        decoration: BoxDecoration(
          color: image != null ? AppColors.kTransparent : AppColors.cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: image != null
                ? AppColors.accentColor.withOpacity(0.4)
                : AppColors.borderColor,
            width: image != null ? 2 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: image != null
                  ? AppColors.accentColor.withOpacity(0.08)
                  : AppColors.shadowColor,
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child:
         image != null
            ? ImageFilledSlotWidget(image: image!, isFront: isFront)
            : ImageEmptySlotWidget(isFront: isFront),
      ),
    );
  }
}