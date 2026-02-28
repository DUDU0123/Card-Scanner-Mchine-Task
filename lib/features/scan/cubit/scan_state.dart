part of 'scan_cubit.dart';

class ScanState extends Equatable {
  const ScanState({this.pickedFrontImage, this.pickedBackImage});
  final File? pickedFrontImage;
  final File? pickedBackImage;

  ScanState copyWith({
    File? pickedFrontImage,
    File? pickedBackImage,
  }) {
    return ScanState(
      pickedFrontImage: pickedFrontImage ?? this.pickedFrontImage,
      pickedBackImage: pickedBackImage ?? this.pickedBackImage,
    );
  }

  @override
  List<Object?> get props => [pickedFrontImage, pickedBackImage];
}

final class ScanInitial extends ScanState {}
