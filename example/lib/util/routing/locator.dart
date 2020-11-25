import 'package:get_it/get_it.dart';
import 'package:example/util/routing/NavigationService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
