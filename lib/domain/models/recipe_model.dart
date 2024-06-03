import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  const factory RecipeModel({
    required int id,
    required String name,
    required int cookTimeMinutes,
    required double rating,
    required List<String> ingredients,
    required String image,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);
}
