class CategoryModel {
  String categoryName;
  bool isSelect;

  CategoryModel({required this.categoryName, this.isSelect = false});

  static List<CategoryModel> getCategory() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(categoryName: "Recent", isSelect: true));
    categories.add(CategoryModel(
      categoryName: "Top 50",
    ));
    categories.add(CategoryModel(
      categoryName: "Top 50",
    ));
    categories.add(CategoryModel(
      categoryName: "Chill",
    ));
    categories.add(CategoryModel(
      categoryName: "Festival",
    ));
    categories.add(CategoryModel(
      categoryName: "Hip-Hop",
    ));
    categories.add(CategoryModel(
      categoryName: "Pop",
    ));
    categories.add(CategoryModel(
      categoryName: "Gavnovoz",
    ));

    return categories;
  }
}
