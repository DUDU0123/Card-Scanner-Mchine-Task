import 'package:business_card_scanner/core/utils/app_imports.dart';
import 'package:business_card_scanner/features/scan/cubit/scan_cubit.dart';
import 'package:business_card_scanner/features/scan/pages/scan_page.dart';
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
            BlocProvider(create: (context) => ScanCubit(),)
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
