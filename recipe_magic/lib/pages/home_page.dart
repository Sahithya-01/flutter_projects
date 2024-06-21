import 'package:flutter/material.dart';
import 'package:recipe_magic/models/recipe.dart';
import 'package:recipe_magic/services/data_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecipBook'),
        centerTitle: true,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _recipeTypeButtons(),
          _recipesList(),
        ],
      ),
    );
  }

  Widget _recipeTypeButtons() {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.05,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: FilledButton(
                  onPressed: () {}, child: const Text("🥐Breakfast")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child:
                  FilledButton(onPressed: () {}, child: const Text("🍱Lunch")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child:
                  FilledButton(onPressed: () {}, child: const Text("🍗Dinner")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child:
                  FilledButton(onPressed: () {}, child: const Text("🥨Snack")),
            ),
          ],
        ));
  }

  Widget _recipesList() {
    return Expanded(
        child: FutureBuilder(
            future: DataService().getRecipes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Unable to load Data"));
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Recipe recipe = snapshot.data![index];
                  return ListTile(
                    contentPadding: EdgeInsets.only(top: 20.0),
                    isThreeLine: true,
                    subtitle: Text(
                        '${recipe.cuisine}\nDifficulty: ${recipe.difficulty}'),
                    leading: Image.network(
                      recipe.image,
                    ),
                    title: Text(recipe.name),
                    trailing: Text("${recipe.rating.toString()} ⭐",
                        style: const TextStyle(fontSize: 15)),
                  );
                },
              );
            }));
  }
}
