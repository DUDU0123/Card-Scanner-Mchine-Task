import 'package:business_card_scanner/core/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<SuccessType, Params>{
 Future<Either<Failure, SuccessType>> call({required Params params});
}