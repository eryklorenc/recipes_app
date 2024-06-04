import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:recipes_app/domain/models/recipe_model.dart';
import 'package:recipes_app/domain/repository/recipe_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final RecipeRepository _recipeRepository;

  HomeCubit(this._recipeRepository) : super(const HomeState());

  Future<void> loadRecipes() async {
    emit(state.copyWith(isLoading: true));

    try {
      final recipesResponse = await _recipeRepository.fetchRecipes();
      emit(state.copyWith(isLoading: false, recipes: recipesResponse));
    } catch (error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    }
  }
}
