import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await setupGetIt();
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}
