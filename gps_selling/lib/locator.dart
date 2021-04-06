import 'package:get_it/get_it.dart';
import 'package:gps_selling/services/api.dart';
import 'package:gps_selling/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setUpLocator(){
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Api());
}