// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeModelImpl _$$RecipeModelImplFromJson(Map<String, dynamic> json) =>
    _$RecipeModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      cookTimeMinutes: (json['cookTimeMinutes'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$RecipeModelImplToJson(_$RecipeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cookTimeMinutes': instance.cookTimeMinutes,
      'rating': instance.rating,
      'ingredients': instance.ingredients,
      'image': instance.image,
    };
