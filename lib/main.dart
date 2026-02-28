import 'package:business_card_scanner/core/constants/app_global_keys.dart';
import 'package:business_card_scanner/features/root_widget_page.dart';
import 'package:business_card_scanner/services/hive_service.dart';
import 'package:business_card_scanner/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  initDependencies();
  await Hive.openBox(HiveService.boxName);
  runApp(RootWidgetPage());
}