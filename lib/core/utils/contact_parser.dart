import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/scan/model/contact_model.dart';

class ContactParser {
  static ContactModel parse(String rawText) {
    final lines = rawText.split('\n').where((e) => e.trim().isNotEmpty).toList();

    String name = lines.isNotEmpty ? lines.first : '';
    String company = '';
    String phone = '';
    String email = '';
    String website = '';

    for (final line in lines) {
      if (company.isEmpty &&
          (line.contains('Pvt') ||
              line.contains('Ltd') ||
              line.contains('Inc'))) {
        company = line;
      }

      if (phone.isEmpty &&
          AppCommonMethods.phoneRegex.hasMatch(line)) {
        phone = AppCommonMethods.phoneRegex.firstMatch(line)!.group(0)!;
      }

      if (email.isEmpty &&
          AppCommonMethods.emailRegex.hasMatch(line)) {
        email = AppCommonMethods.emailRegex.firstMatch(line)!.group(0)!;
      }

      if (website.isEmpty &&
          AppCommonMethods.websiteRegex.hasMatch(line)) {
        website = AppCommonMethods.websiteRegex.firstMatch(line)!.group(0)!;
      }
    }

    return ContactModel(
      name: name,
      company: company,
      phone: phone,
      email: email,
      website: website,
    );
  }
}