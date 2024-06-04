// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:recipes_app/app/core/utils/injection_container.dart' as _i7;
import 'package:recipes_app/data/datasources/recipe_datasources.dart' as _i4;
import 'package:recipes_app/domain/repository/recipe_repository.dart' as _i5;
import 'package:recipes_app/features/home/cubit/home_cubit.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio());
    gh.factory<_i4.RecipeApiDatasources>(
        () => _i4.RecipeApiDatasources(gh<_i3.Dio>()));
    gh.factory<_i5.RecipeRepository>(
        () => _i5.RecipeRepository(gh<_i4.RecipeApiDatasources>()));
    gh.factory<_i6.HomeCubit>(() => _i6.HomeCubit(gh<_i5.RecipeRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
