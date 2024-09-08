class CategoriesModel {
  List<CategoryModel>? categories;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categories = json['data'] != null
        ? List<CategoryModel>.from(
            json['data']?.map((x) => CategoryModel.fromjson(x)))
        : null;
  }
}

class CategoryModel {
  int? id;
  String? name;
  bool? isVisible;

  CategoryModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isVisible = json['is_visible'];
  }
}
