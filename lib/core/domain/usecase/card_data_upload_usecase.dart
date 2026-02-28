import 'dart:io';

import 'package:business_card_scanner/core/failure/failure.dart';
import 'package:business_card_scanner/core/usecase/usecase.dart';
import 'package:business_card_scanner/core/domain/repo/card_data_repo.dart';
import 'package:fpdart/fpdart.dart';

class CardDataUploadUsecase implements Usecase<bool,ParamModel>{
  final CardDataRepo cardDataRepo;

  CardDataUploadUsecase({required this.cardDataRepo});
  @override
  Future<Either<Failure, bool>> call({required ParamModel params}) {
    return cardDataRepo.uploadCardData(frontImage: params.frontImage, backImage: params.backImage);
  }
}

class ParamModel{
  final File frontImage;
  final File backImage;

  ParamModel({required this.frontImage, required this.backImage});
}