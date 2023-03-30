import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/category_model.dart';

// class CategoryProvider with ChangeNotifier {
//   late CategoryModel categoryModel;

//   List<CategoryModel> search = [];
//   categoryModels(QueryDocumentSnapshot element) {
    
//     search.add(categoryModel);
//   }

//   /////////////// categoryModel ///////////////////////////////
//   List<CategoryModel> categoryList = [];

//   fatchCategoryListData() async {
//     // QuerySnapshot value =
//     //     await FirebaseFirestore.instance.collection("category").get();
//     final categoryCollection = FirebaseFirestore.instance.collection('category');
//     final value = await categoryCollection.get();
//     value.docs.forEach(
//       (element) {
//         final categoryId = element.id;
//         categoryModel = CategoryModel(
//         id: element.get("id") as String,
//         categoryImage: element.get("categoryImage") as String,
//         categoryName: element.get("categoryName") as String,
//     );
//       final subcategoryQuerySnapshot =
//              categoryCollection.doc(categoryId).collection('subCategory').get();
//         subcategoryQuerySnapshot.docs.forEach(element)
//       },
//     );
//     notifyListeners();
//   }

//   List<CategoryModel> get getcategoryList {
//     return search;
//   }
// }

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categoryList = [];

  List<CategoryModel> get categoryList => _categoryList;

  // Fetches the categories and subcategories from Firestore
  Future<void> fetchCategoryListData() async {
    try {
      final categoryCollection = FirebaseFirestore.instance.collection('category');
      final querySnapshot = await categoryCollection.get();

      final List<CategoryModel> categories = [];

      // Loop through the category documents
      for (final categoryDoc in querySnapshot.docs) {
        final categoryId = categoryDoc.id;
        final categoryData = categoryDoc.data();

        final category = CategoryModel(
          id: categoryId,
          categoryName: categoryData['categoryName'],
          categoryImage: categoryData['categoryImage'],
          subcategories: [],
        );

        // Get the subcategories for this category
        final subcategoryQuerySnapshot =
            await categoryCollection.doc(categoryId).collection('subcategory').get();

        // Loop through the subcategory documents
        for (final subcategoryDoc in subcategoryQuerySnapshot.docs) {
          final subcategoryId = subcategoryDoc.id;
          final subcategoryData = subcategoryDoc.data();

          final subcategory = SubcategoryModel(
            id: subcategoryId,
            subcategoryName: subcategoryData['subcategoryName'],
            subcategoryImage: subcategoryData['subcategoryImage'],
          );

          // Add the subcategory to the category's subcategories list
          category.subcategories!.add(subcategory);
        }

        categories.add(category);
      }

      // Update the provider's categoryList
      _categoryList = categories;

      notifyListeners();
    } catch (error) {
      print('Error fetching categories: $error');
    }
  }
  List<CategoryModel> get getcategoryList {
    return _categoryList;
  }
}
