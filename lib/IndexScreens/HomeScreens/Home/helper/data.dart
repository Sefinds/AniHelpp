import '../models/categori_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel =  CategoryModel();

  //1
  categoryModel.categoryName = "The Latest";
  categoryModel.imageURL = "https://images.unsplash.com/photo-1589656966895-2f33e7653819?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80";
  category.add(categoryModel);

  //2
  categoryModel =  CategoryModel();
  categoryModel.categoryName = "Trending Now";
  categoryModel.imageURL = "https://images.unsplash.com/photo-1476304884326-cd2c88572c5f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80";
  category.add(categoryModel);

  //3
  categoryModel =  CategoryModel();
  categoryModel.categoryName = "Healthy living";
  categoryModel.imageURL = "https://images.unsplash.com/photo-1484557985045-edf25e08da73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1073&q=80";
  category.add(categoryModel);

  //4
  categoryModel =  CategoryModel();
  categoryModel.categoryName = "Animals spotlight";
  categoryModel.imageURL = "https://images.unsplash.com/photo-1505148230895-d9a785a555fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80";
  category.add(categoryModel);

  //5
  categoryModel =  CategoryModel();
  categoryModel.categoryName = "Industry news";
  categoryModel.imageURL = "https://images.unsplash.com/photo-1614852624829-584c1538d7fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80";
  category.add(categoryModel);

  return category;
}