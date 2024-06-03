import 'package:flutter/material.dart';
import 'package:recipes_app/app/core/utils/injection_container.dart';
import 'package:recipes_app/data/datasources/recipe_datasources.dart';
import 'package:recipes_app/domain/models/recipe_model.dart';
import 'package:recipes_app/features/recipe_details/recipe_details_page.dart';
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
      appBar: AppBar(
        title: Text(
          S.of(context).recipes,
        ),
      ),
      body: Column(
        children: [
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _recipes.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: _recipes.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(_recipes[index].image),
                            title: Text(_recipes[index].name),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailsPage(recipe: _recipes[index]),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Text(
                        S.of(context).no_recipes,
                      ),
                    ),
        ],
      ),
    );
  }
}
