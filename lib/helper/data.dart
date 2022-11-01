
import 'package:news_flutter/models/category_model.dart';
List<CategoryModel> getCategories(){

  List<CategoryModel> category =<CategoryModel>[];

//1
  CategoryModel categoryModel =  CategoryModel();
  categoryModel.categoryName ="Business";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80";
  category.add(categoryModel);

  //2
  categoryModel =CategoryModel();
  categoryModel.categoryName ="Entertainment";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1486572788966-cfd3df1f5b42?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80";
  category.add(categoryModel);

  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName ="Health";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1558554142-0b016c857381?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80";
  category.add(categoryModel);


  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName ="Science";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1507668077129-56e32842fceb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80";
  category.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName ="Sport";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80";
  category.add(categoryModel);


  //6
  categoryModel = CategoryModel();
  categoryModel.categoryName ="Technology";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  category.add(categoryModel);
  return category;

}
