import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:business_card_scanner/features/scan/presentation/widgets/image_upload_slot_widget.dart';
import 'package:business_card_scanner/features/scan/presentation/widgets/scan_page_appbar.dart';
import 'package:business_card_scanner/features/scan/presentation/widgets/scan_page_buttons.dart';
import 'package:business_card_scanner/features/scan/presentation/widgets/scan_page_small_widgets.dart';
import 'package:business_card_scanner/features/scan/presentation/widgets/section_label.dart';
import 'package:business_card_scanner/features/scan/presentation/widgets/tips_showing_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ScanCubit, ScanState>(
          builder: (context, state) {
            return Column(
              children: [
                ScanPageAppbar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppConstraints.kHeight16,
                        scanPageTopInfoBanner(),
                        AppConstraints.kHeight28,
                        SectionLabel(
                          label: 'FRONT SIDE',
                          icon: Icons.credit_card_outlined,
                        ),
                        AppConstraints.kHeight10,
                        ImageUploadSlotWidget(isFront: true, image: state.pickedFrontImage),
                        AppConstraints.kHeight20,
                        SectionLabel(
                          label: 'BACK SIDE',
                          icon: Icons.flip_outlined,
                        ),
                        AppConstraints.kHeight10,
                        ImageUploadSlotWidget(isFront: false, image: state.pickedBackImage),
                        AppConstraints.kHeight28,
                        TipsShowingWidget(),
                        AppConstraints.kHeight28,
                        ScanPageButtons(),
                        AppConstraints.kHeight32,
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}