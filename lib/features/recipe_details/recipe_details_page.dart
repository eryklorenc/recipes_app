import 'package:flutter/material.dart';
import 'package:recipes_app/app/core/theme/app_text_theme_extension.dart';
import 'package:recipes_app/domain/models/recipe_model.dart';
import 'package:recipes_app/generated/l10n.dart';

class RecipeDetailsPage extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(recipe.name),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                recipe.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).ingredients,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.ingredients
                        .map((ingredient) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                S.of(context).Ingredients0(ingredient),
                                style: Theme.of(context).xTextTheme.body1,
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).instructions,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.ingredients
                        .asMap()
                        .entries
                        .map((entry) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                S.of(context).ingredient_item(
                                      (entry.key + 1).toString(),
                                      entry.value,
                                    ),
                                style: Theme.of(context).xTextTheme.body1,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
