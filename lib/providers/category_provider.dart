import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/category_model.dart';

class CategoryProvider with ChangeNotifier {
  late CategoryModel categoryModel;

  List<CategoryModel> search = [];
  categoryModels(QueryDocumentSnapshot element) {
    categoryModel = CategoryModel(
      categoryImage: element.get("categoryImage") as String,
      categoryName: element.get("categoryName") as String,
    );
    search.add(categoryModel);
  }

  /////////////// categoryModel ///////////////////////////////
  List<CategoryModel> categoryList = [];

  fatchCategoryListData() async {
    List<CategoryModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("category").get();

    value.docs.forEach(
      (element) {
        categoryModels(element);
        newList.add(categoryModel);
      },
    );
    categoryList = newList;
    notifyListeners();
  }

  List<CategoryModel> get getcategoryList {
    return search;
  }
}
