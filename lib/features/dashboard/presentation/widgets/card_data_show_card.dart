import 'package:business_card_scanner/core/components/common_action_button.dart';
import 'package:business_card_scanner/core/data/model/card_model.dart';
import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/dashboard/presentation/widgets/card_info_row.dart';
import 'package:url_launcher/url_launcher.dart';

class CardDataShowCard extends StatelessWidget {
  const CardDataShowCard({super.key, required this.cardModel});

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Name
            Text(
              (cardModel.name?.isNotEmpty ?? false) ? (cardModel.name ?? 'Unnamed Contact') : 'Unnamed Contact',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            AppConstraints.kHeight4,

            /// Company
            if (cardModel.company?.isNotEmpty ?? false)
              Text(
                cardModel.company!,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade700,
                ),
              ),

            AppConstraints.kHeight12,

            if(cardModel.phone != null) CardInfoRow(icon: Icons.phone, text: cardModel.phone ?? ''),
            if(cardModel.email != null) CardInfoRow(icon: Icons.email, text: cardModel.email ?? ''),

            if (cardModel.website?.isNotEmpty ?? false)
              CardInfoRow(icon: Icons.language, text: cardModel.website ?? ''),

            AppConstraints.kHeight16,

            /// Action Buttons
            if (cardModel.phone != null && cardModel.phone?.isNotEmpty == true) Row(
              children: [
                Expanded(
                  child: CommonActionButton(
                    icon: Icons.call,
                    label: 'Call',
                    color: Colors.green,
                    onTap: () {
                      final phone = AppCommonMethods.normalizeIndianPhone(cardModel.phone!);
                      AppCommonMethods.launchAppUrl('tel:$phone');
                    }
                  ),
                ),
                AppConstraints.kWidth12,
                Expanded(
                  child: CommonActionButton(
                    icon: Icons.chat,
                    label: 'WhatsApp',
                    color: Colors.teal,
                    onTap: () {
                      final phone = AppCommonMethods.normalizeIndianPhone(cardModel.phone!);
                      AppCommonMethods.launchAppUrl('https://wa.me/$phone');
                    }
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}