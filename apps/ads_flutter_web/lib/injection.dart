// ignore_for_file: await_only_futures

import 'package:core/di/injection.dart';
import 'package:get_it_export/get_it.dart';
import 'package:home/home.dart';
import 'package:injectable_export/injectable.dart';
import 'package:login/login.dart';
import 'package:secure_storage/secure_storage.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await configureSecureStorageDependencies(getIt);
  await configureCoreDependencies(getIt);
  await configureHomeDependencies(getIt);

  await configureLoginDependencies(getIt);
  await getIt.init();
}
