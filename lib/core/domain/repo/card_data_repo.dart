import 'dart:io';

import 'package:business_card_scanner/core/data/model/card_model.dart';
import 'package:business_card_scanner/core/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class CardDataRepo {
  Future<Either<Failure, bool>> uploadCardData({required File frontImage, required File backImage});
  Either<Failure, List<CardModel>> getAllCardData();
}