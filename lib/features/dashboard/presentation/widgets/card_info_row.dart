import 'package:business_card_scanner/core/utils/app_imports.dart';

class CardInfoRow extends StatelessWidget {
  const CardInfoRow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        children: [
          Icon(icon, size: 18.sp, color: Colors.grey.shade600),
          AppConstraints.kWidth8,
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}