import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:business_card_scanner/features/scan/presentation/pages/scan_page.dart';
import 'package:business_card_scanner/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => serviceLocator<ScanCubit>())
          ],
          child: MaterialApp(
            navigatorKey: AppGlobalKeys.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(
              useMaterial3: true,
            ).copyWith(scaffoldBackgroundColor: AppColors.backgroundColor),
            home: ScanPage(),
          ),
        );
      },
    );
  }
}
