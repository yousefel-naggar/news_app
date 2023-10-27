import 'package:flutter/material.dart';
import 'package:news/shared/styles/colors.dart';

class CategoryModel {
  String name;
  String id;
  String img;
  Color color;

  CategoryModel(this.name, this.id, this.img, this.color);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          "Sports", "sports", "assets/ball.png", ColorsData.sportBackground),
      CategoryModel("Politics", "general", "assets/Politics.png",
          ColorsData.politicsBackground),
      CategoryModel("Business", "business", "assets/bussines.png",
          ColorsData.businessBackground),
      CategoryModel(
          "Health", "health", "assets/health.png", ColorsData.healthBackground),
      CategoryModel("Entertainment", "entertainment", "assets/environment.png",
          ColorsData.enviromentBackground),
      CategoryModel("Science", "science", "assets/science.png",
          ColorsData.scienceBackground),
    ];
  }
}
