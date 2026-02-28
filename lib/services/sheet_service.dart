import 'dart:convert';
import 'package:http/http.dart' as http;
import '../features/scan/data/model/card_model.dart';

class SheetsService {
  static const _webhookUrl = "https://script.google.com/macros/s/AKfycbzGa_bxfvmX4TyuLRx9DEqjTNU6cKDZSxX95gp_KJDvv30wWkAnaRZ95JHQquwPuhMs/exec";

  Future<void> save(CardModel contact) async {
    final response = await http.post(
      Uri.parse(_webhookUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(contact.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to save to Google Sheets");
    }
  }
}