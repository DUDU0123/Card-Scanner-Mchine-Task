import 'dart:io';

import 'package:business_card_scanner/core/utils/app_common_methods.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

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

  void uploadData() {
    try {
      // parse the data and upload to hive
    } catch (e) {
      
    }
  }
}
