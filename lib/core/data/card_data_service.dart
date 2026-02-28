import 'dart:io';

import 'package:business_card_scanner/core/failure/failure.dart';
import 'package:business_card_scanner/core/utils/card_parser.dart';
import 'package:business_card_scanner/core/data/model/card_model.dart';
import 'package:business_card_scanner/services/hive_service.dart';
import 'package:business_card_scanner/services/ocr_service.dart';
import 'package:business_card_scanner/services/sheet_service.dart';

abstract class CardDataService {
  Future<bool> uploadCardData({required File frontImage, required File backImage});
  List<CardModel> getAllCardData();
}
class CardDataServiceImpl implements CardDataService {
  final OcrService ocrService;
  final SheetsService sheetService;
  final HiveService hiveService;

  CardDataServiceImpl({required this.ocrService, required this.sheetService, required this.hiveService});
  @override
  Future<bool> uploadCardData({required File frontImage, required File backImage}) async {
    try {
      final frontImageText = await ocrService.extractText(image: frontImage); //extracting front image text
      final backImageText = await ocrService.extractText(image: backImage); //extracting back image text
      final frontModel = CardParser.parse(frontImageText); //parsing front image text
      final backModel = CardParser.parse(backImageText); //parsing front image text
      final finalModel = frontModel.merge(backModel); //getting the final model with all details
      // writing the data to sheet
      sheetService.save(finalModel);
      // storing this data to hive database
      await hiveService.saveCard(finalModel);
      return true;
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  List<CardModel> getAllCardData() {
    try {
      final cardDataList = hiveService.getAllCards();
      return cardDataList;
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

}