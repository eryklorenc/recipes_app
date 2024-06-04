import 'package:flutter/material.dart';
import 'package:recipes_app/app/core/utils/injection_container.dart';
import 'package:recipes_app/data/datasources/recipe_datasources.dart';
import 'package:recipes_app/domain/models/recipe_model.dart';
import 'package:recipes_app/features/home/widgets/recipe_card.dart';
import 'package:recipes_app/features/recipe_details/ui/recipe_details_page.dart';
import 'package:recipes_app/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<List<RecipeModel>> futureRecipes;
  bool _isLoading = false;
  List<RecipeModel> _recipes = [];

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  void _loadRecipes() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final apiService = getIt<RecipeApiDatasources>();
      final recipesResponse = await apiService.fetchRecipes();

      setState(() {
        _recipes = recipesResponse;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _recipes.isNotEmpty
              ? ListView.builder(
                  itemCount: _recipes.length,
                  itemBuilder: (context, index) {
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
                                builder: (context) => RecipeDetailsPage(recipe: _recipes[index]),
                              ),
                            );
                          },
                          child: RecipeCard(
                            title: _recipes[index].name,
                            rating: _recipes[index].rating.toString(),
                            cookTime: _recipes[index].cookTimeMinutes.toString(),
                            thumbnailUrl: _recipes[index].image,
                          ),
                        ),
                      ],
                    );
                  },
                )
              : Center(
                  child: Text(
                    S.of(context).no_recipes,
                  ),
                ),
    );
  }
}
