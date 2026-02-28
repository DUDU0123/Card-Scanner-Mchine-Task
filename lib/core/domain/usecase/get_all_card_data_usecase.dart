import 'package:business_card_scanner/core/data/model/card_model.dart';
import 'package:business_card_scanner/core/domain/repo/card_data_repo.dart';
import 'package:business_card_scanner/core/failure/failure.dart';
import 'package:business_card_scanner/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

class GetAllCardDataUsecase implements NormalUsecase<List<CardModel>, Null>{
  final CardDataRepo cardDataRepo;

  GetAllCardDataUsecase({required this.cardDataRepo});
  @override
  Either<Failure, List<CardModel>> call({required Null params}) {
    return cardDataRepo.getAllCardData();
  }
}