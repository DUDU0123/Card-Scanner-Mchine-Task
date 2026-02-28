import 'dart:io';

import 'package:business_card_scanner/core/failure/failure.dart';
import 'package:business_card_scanner/features/scan/data/card_data_upload_service.dart';
import 'package:business_card_scanner/features/scan/domain/repo/card_data_repo.dart';
import 'package:fpdart/fpdart.dart';

class CardDataRepoImpl implements CardDataRepo{
  final CardDataUploadService cardDataUploadService;

  CardDataRepoImpl({required this.cardDataUploadService});
  @override
  Future<Either<Failure, bool>> uploadCardData({required File frontImage, required File backImage}) async{
    try {
      final res = await cardDataUploadService.uploadCardData(frontImage: frontImage, backImage: backImage);
      return right(res);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}