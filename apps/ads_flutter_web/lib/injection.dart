// ignore_for_file: await_only_futures

import 'package:core/di/injection.dart';
import 'package:get_it_export/get_it.dart';
import 'package:home/home.dart';
import 'package:injectable_export/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await configureCoreDependencies(getIt);
  await configureHomeDependencies(getIt);
  await getIt.init();
}
