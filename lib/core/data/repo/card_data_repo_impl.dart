import 'dart:io';

import 'package:business_card_scanner/core/data/model/card_model.dart';
import 'package:business_card_scanner/core/failure/failure.dart';
import 'package:business_card_scanner/core/data/card_data_service.dart';
import 'package:business_card_scanner/core/domain/repo/card_data_repo.dart';
import 'package:fpdart/fpdart.dart';

class CardDataRepoImpl implements CardDataRepo{
  final CardDataService cardDataService;

  CardDataRepoImpl({required this.cardDataService});
  @override
  Future<Either<Failure, bool>> uploadCardData({required File frontImage, required File backImage}) async{
    try {
      final res = await cardDataService.uploadCardData(frontImage: frontImage, backImage: backImage);
      return right(res);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Either<Failure, List<CardModel>> getAllCardData() {
    try {
      final value = cardDataService.getAllCardData();
      return right(value);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}