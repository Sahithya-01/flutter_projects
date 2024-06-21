import 'package:recipe_magic/models/recipe.dart';
import 'package:recipe_magic/services/http_service.dart';

class DataService {
  static final DataService _singleton = DataService._internal();
  final HttpService _httpService = HttpService();

  factory DataService() {
    return _singleton;
  }
  DataService._internal();
  Future<List<Recipe>?> getRecipes() async {
    String path = 'recipes/';
    var response = await _httpService.get(path);
    if (response?.statusCode == 200 && response?.data != null) {
      List data = response!.data["recipes"];
      List<Recipe> recipes = data.map((e) => Recipe.fromJson(e)).toList();
      print(recipes);
      return recipes;
    }
  }
}
