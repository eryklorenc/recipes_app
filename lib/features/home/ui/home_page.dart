import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/app/core/utils/injection_container.dart';
import 'package:recipes_app/features/home/cubit/home_cubit.dart';
import 'package:recipes_app/features/home/widgets/recipe_card.dart';
import 'package:recipes_app/features/recipe_details/ui/recipe_details_page.dart';
import 'package:recipes_app/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..loadRecipes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).recipes),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.errorMessage.isNotEmpty) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state.recipes.isEmpty) {
              return Center(
                child: Text(S.of(context).no_recipes),
              );
            } else {
              return ListView.builder(
                itemCount: state.recipes.length,
                itemBuilder: (context, index) {
                  final recipe = state.recipes[index];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeDetailsPage(recipe: recipe),
                            ),
                          );
                        },
                        child: RecipeCard(
                          title: recipe.name,
                          rating: recipe.rating.toString(),
                          cookTime: recipe.cookTimeMinutes.toString(),
                          thumbnailUrl: recipe.image,
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
