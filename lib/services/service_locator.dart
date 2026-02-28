import 'package:business_card_scanner/core/data/card_data_service.dart';
import 'package:business_card_scanner/core/data/repo/card_data_repo_impl.dart';
import 'package:business_card_scanner/core/domain/repo/card_data_repo.dart';
import 'package:business_card_scanner/core/domain/usecase/card_data_upload_usecase.dart';
import 'package:business_card_scanner/core/domain/usecase/get_all_card_data_usecase.dart';
import 'package:business_card_scanner/features/dashboard/presentation/cubit/dashboard_cubit.dart';
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

    ..registerFactory<CardDataService>(
      () => CardDataServiceImpl(
        ocrService: serviceLocator<OcrService>(),
        sheetService: serviceLocator<SheetsService>(),
        hiveService: serviceLocator<HiveService>(),
      ),
    )

    ..registerFactory<CardDataRepo>(
      () => CardDataRepoImpl(
        cardDataService: serviceLocator<CardDataService>(),
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
    )
    ..registerFactory(() => GetAllCardDataUsecase(cardDataRepo: serviceLocator<CardDataRepo>()),)
    ..registerFactory(() => DashboardCubit(getAllCardDataUsecase: serviceLocator<GetAllCardDataUsecase>()),);
}