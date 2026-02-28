import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/contact_model.dart';

class SheetsService {
  static const _webhookUrl = "YOUR_GOOGLE_SCRIPT_URL";

  Future<void> save(ContactModel contact) async {
    final response = await http.post(
      Uri.parse(_webhookUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(contact.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to save to Google Sheets");
    }
  }
}