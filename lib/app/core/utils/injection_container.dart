import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:recipes_app/app/core/const/const.dart';
import 'package:recipes_app/app/core/utils/injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(baseUrl: Const.baseUrl));
}
