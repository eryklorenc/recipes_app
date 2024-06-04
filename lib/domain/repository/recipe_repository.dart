import 'package:injectable/injectable.dart';
import 'package:recipes_app/data/datasources/recipe_datasources.dart';
import 'package:recipes_app/domain/models/recipe_model.dart';

@injectable
class RecipeRepository {
  final RecipeApiDatasources _apiDatasources;

  RecipeRepository(this._apiDatasources);

  Future<List<RecipeModel>> fetchRecipes() async {
    try {
      return await _apiDatasources.fetchRecipes();
    } catch (error) {
      throw Exception('Failed to load recipes: $error');
    }
  }
}
