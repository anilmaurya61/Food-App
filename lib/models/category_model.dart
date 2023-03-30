// class CategoryModel {
//   String? categoryName;
//   String? categoryImage;

//   CategoryModel(
//       {
//       this.categoryImage,
//       this.categoryName
//       });
// }

class CategoryModel {
  String? id;
  String? categoryName;
  String? categoryImage;
  List<SubcategoryModel>? subcategories;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
    this.subcategories,
  });
}

class SubcategoryModel {
  String? subcategoryName;
  String? subcategoryImage;
  String? id;
  SubcategoryModel({
    required this.id,
    this.subcategoryName,
    this.subcategoryImage,
  });
}
