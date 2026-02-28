import 'dart:io';

import 'package:business_card_scanner/core/utils/app_common_methods.dart';
import 'package:business_card_scanner/features/scan/domain/usecase/card_data_upload_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit({
    required this.cardDataUploadUsecase,
  }) : super(ScanInitial());
  final CardDataUploadUsecase cardDataUploadUsecase;

  Future<void> pickImage({required ImageSource source, required bool isFrontImage}) async {
    try {
      final pickedXFile = await ImagePicker().pickImage(
        source: source,
        imageQuality: 70,      // 🔥 reduces memory
        maxWidth: 1800,        // 🔥 limits decode size
        maxHeight: 1800,
      );
    if (pickedXFile != null) {
      File imageFile = File(pickedXFile.path);
      emit(state.copyWith(
        pickedBackImage: isFrontImage ? state.pickedBackImage : imageFile,
        pickedFrontImage: isFrontImage ? imageFile : state.pickedFrontImage,
      ));
    } else {
      AppCommonMethods.commonSnackBar(message: "Unable to pick image");
    }
    } catch (e) {
      AppCommonMethods.commonSnackBar(message: "Unable to pick image");
    }
  }

  void emptyImageUploadSlots({required bool isFront}) {
    try {
      emit(ScanState(
        pickedBackImage: isFront ? state.pickedBackImage : null,
        pickedFrontImage: isFront ? null : state.pickedFrontImage,
      ));
    } catch (e) {
      AppCommonMethods.commonSnackBar(message: "Unable to remove image");
    }
  }

  Future<void> uploadData() async {
    try {
      // parse the data and upload to hive
      final frontImage = state.pickedFrontImage;
      final backImage = state.pickedBackImage;
      if (frontImage != null && backImage != null) {
        final res = await cardDataUploadUsecase.call(params: ParamModel(frontImage: frontImage, backImage: backImage));
        res.fold((failure) {
          AppCommonMethods.commonSnackBar(message: failure.message);
          emit(state.copyWith(pickedBackImage: state.pickedBackImage, pickedFrontImage: state.pickedFrontImage));
        }, (r) {
          AppCommonMethods.commonSnackBar(message: "Uploaded successfully");
          emit(ScanState(pickedFrontImage: null, pickedBackImage: null));
        },);
      } else {
        
      }
    } catch (e) {
      emit(state.copyWith(pickedBackImage: state.pickedBackImage, pickedFrontImage: state.pickedFrontImage));
    }
  }
}
