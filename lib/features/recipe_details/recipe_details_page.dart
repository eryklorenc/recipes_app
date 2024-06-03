import 'package:flutter/material.dart';
import 'package:recipes_app/domain/models/recipe_model.dart';
import 'package:recipes_app/generated/l10n.dart';

class RecipeDetailsPage extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe.image),
            const SizedBox(height: 16.0),
            Text(S.of(context).ingredients, style: Theme.of(context).textTheme.titleLarge),
            ...recipe.ingredients.map(
              (ingredient) => Text(ingredient),
            ),
          ],
        ),
      ),
    );
  }
}
