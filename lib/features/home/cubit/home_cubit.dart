import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:recipes_app/app/core/utils/injection_container.dart';
import 'package:recipes_app/data/datasources/recipe_datasources.dart';
import 'package:recipes_app/domain/models/recipe_model.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> loadRecipes() async {
    emit(state.copyWith(isLoading: true));

    try {
      final apiService = getIt<RecipeApiDatasources>();
      final recipesResponse = await apiService.fetchRecipes();
      emit(state.copyWith(isLoading: false, recipes: recipesResponse));
    } catch (error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    }
  }
}
