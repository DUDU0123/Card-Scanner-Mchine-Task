import 'package:business_card_scanner/core/utils/app_imports.dart';

class ImageEmptySlotWidget extends StatelessWidget {
  const ImageEmptySlotWidget({super.key, required this.isFront});
  final bool isFront;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.accentSoft,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.accentMidColor),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                isFront ? Icons.credit_card_outlined : Icons.flip_outlined,
                color: AppColors.accentColor,
                size: 26,
              ),
              Positioned(
                bottom: 7,
                right: 7,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentColor.withOpacity(0.35),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 13),
                ),
              ),
            ],
          ),
        ),
        AppConstraints.kHeight14,
        Text(
          isFront ? 'Upload Front Side' : 'Upload Back Side',
          style: const TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        AppConstraints.kHeight4,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.photo_library_outlined,
              size: 13,
              color: AppColors.textSecondaryColor,
            ),
            AppConstraints.kWidth5,
            const Text(
              'Gallery  ·  Camera',
              style: TextStyle(
                color: AppColors.textSecondaryColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}