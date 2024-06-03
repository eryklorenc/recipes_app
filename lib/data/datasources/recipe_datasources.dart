import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:recipes_app/app/core/const/const.dart';
import 'package:recipes_app/domain/models/recipe_model.dart';

@injectable
class RecipeApiDatasources {
  final Dio _dio;

  RecipeApiDatasources(this._dio);

  Future<List<RecipeModel>> fetchRecipes() async {
    try {
      final response = await _dio.get('${Const.baseUrl}/recipes');
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = response.data['recipes'];
        return jsonResponse.map((recipe) => RecipeModel.fromJson(recipe)).toList();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (error) {
      throw Exception('Failed to load recipes: $error');
    }
  }
}
