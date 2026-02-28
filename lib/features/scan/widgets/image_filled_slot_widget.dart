import 'dart:io';

import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/scan/cubit/scan_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageFilledSlotWidget extends StatelessWidget {
  const ImageFilledSlotWidget({
    super.key,
    required this.image,
    required this.isFront,
  });
  final File image;
  final bool isFront;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(image, fit: BoxFit.cover),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.55)],
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentColor.withOpacity(0.3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Text(
                isFront ? 'Front' : 'Back',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                context.read<ScanCubit>().emptyImageUploadSlots(
                  isFront: isFront,
                );
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.92),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: AppColors.shadowColor, blurRadius: 4),
                  ],
                ),
                child: const Icon(
                  Icons.close,
                  color: AppColors.textPrimaryColor,
                  size: 15,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 12,
            child: Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: AppColors.tealColor,
                    size: 12,
                  ),
                ),
                AppConstraints.kWidth6,
                const Text(
                  'Uploaded · Tap to change',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
