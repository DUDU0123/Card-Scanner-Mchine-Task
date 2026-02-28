import 'package:business_card_scanner/features/scan/data/card_data_upload_service.dart';
import 'package:business_card_scanner/features/scan/data/repo/card_data_repo_impl.dart';
import 'package:business_card_scanner/features/scan/domain/repo/card_data_repo.dart';
import 'package:business_card_scanner/features/scan/domain/usecase/card_data_upload_usecase.dart';
import 'package:business_card_scanner/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:business_card_scanner/services/hive_service.dart';
import 'package:business_card_scanner/services/ocr_service.dart';
import 'package:business_card_scanner/services/sheet_service.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void initDependencies(){
  initCardDataDependencies();
}

void initCardDataDependencies() {
  serviceLocator
    ..registerLazySingleton<OcrService>(() => OcrService())
    ..registerLazySingleton<SheetsService>(() => SheetsService())
    ..registerLazySingleton<HiveService>(() => HiveService())

    ..registerFactory<CardDataUploadService>(
      () => CardDataUploadServiceImpl(
        ocrService: serviceLocator<OcrService>(),
        sheetService: serviceLocator<SheetsService>(),
        hiveService: serviceLocator<HiveService>(),
      ),
    )

    ..registerFactory<CardDataRepo>(
      () => CardDataRepoImpl(
        cardDataUploadService: serviceLocator<CardDataUploadService>(),
      ),
    )

    ..registerFactory(
      () => CardDataUploadUsecase(
        cardDataRepo: serviceLocator<CardDataRepo>(),
      ),
    )

    ..registerFactory(
      () => ScanCubit(
        cardDataUploadUsecase: serviceLocator<CardDataUploadUsecase>(),
      ),
    );
}