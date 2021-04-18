import 'package:flutter_generic_app/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureInjection(String enviroment) => $initGetIt(getIt, environment: enviroment);

abstract class Env {
  static const test = 'test';
  static const dev = 'dev';
  static const prod = 'prod';
}